## b-b-q

### Description

Event management app in which you can create events, subscribe to them, comment on them, attach photos, restrict access to them.

Carousel and viewer are organized for photogallery. Subscribers receive letters using mailer.

VK and Facebook authentification is implemented.

Event places are displayed on the built-in Yandex.maps.

Realized in Ruby on Rails 5. Language: Russian.

### Launching

1. Download or clone repo.

2. Use your own credentials as in examples

```
$ cp config/database.yml.example config/database.yml
$ cp config/secrets.yml.example config/secrets.yml
$ cp .env.example .env
```

2. Use bundler

```console
$ bundle install
```

NB: If you want at the same time create the database, load the schema and initialize it with the seed data run

```console
$ rails db:setup
```

Skip Items 2-4 in this case.

2. Create database

```console
$ rails db:create
```

3. Run database migrations

```console
$ rails db:migrate
```

4. If you want to populate your database with seed data run

```console
$ rails db:seed
```

### License

MIT – see `LICENSE`

### Contacts

Email me at

```rb
'dcdl-snotynu?fl`hk-bnl'.each_char.map(&:succ).join
```
