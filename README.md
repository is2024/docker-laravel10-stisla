# STISLA Docker
Using Laravel 10 and Nginx

---
- Copy `.env.example` inside **laravel10-stisla** directory into `.env`. 
- Once copied, open the `.env` file, then set the value of `DB_PASSWORD` to `laravel_stisla`. The result will look like this:
```toml
DB_USERNAME=root
DB_PASSWORD=laravel_stisla
```
- Run `make setup`.
- Run `make data`.
- `make stop` to stop the container.
- To start the container again, do `make start`.

