FROM ruby:2.6

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev libxslt-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME="/myapp"

WORKDIR $HOME

# Counter Measure to Error:"Autoprefixer doesn’t support Node v4.8.2. Update it"
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN apt-get update && \
    apt-get install -y postgresql-client \
    sqlite3 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*


ADD Gemfile      $HOME/Gemfile
ADD Gemfile.lock $HOME/Gemfile.lock

RUN bundle install

ADD ./ $HOME
COPY ./ $HOME

CMD ["rails", "server", "-b", "0.0.0.0"]

RUN rake db:create
RUN rake db:migrate
