Projekt Euler
=============

![Build Status](https://github.com/projekteuler/projekteuler/workflows/CI/badge.svg)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/68921bff5347435f8fff10c1d6872568)](https://www.codacy.com/app/projekteuler/projekteuler)

This is the Ruby on Rails web-app powering [projekteuler.de](https://projekteuler.de).
It allows visitors to view and suggest German translations of the maths puzzles found on [projecteuler.net](https://projecteuler.net).

## Getting started
1. Download this repository, e.g., with `git clone`.
2. Make sure [NodeJS](https://nodejs.org) is installed.
3. Navigate inside the repository folder.
4. Use bundler to install all required gems.
        
        $ bundle install
        
5. Setup the database:

        $ bin/rails db:setup
        
6. Start the server:

        $ bin/rails server
        
7. Open `http://localhost:3000` in your browser. You should see the web app up and running!
8. Start playing with the web app. By default, the database will contain some users and translations. The user `admin` can review translations, while the user `translator` has submitted some translations.
You can login as any user by clicking the Login button and entering their name. This is simply a mock OAuth login; in production mode, GitHub is used for login.
9. If you ever want to reset the database to the original state, run `rails db:reset`.

## Contributing
Do you have a suggestion for an improvement for the web app? Please create an [issue](https://github.com/projekteuler/projekteuler/issues) for it.

Do you want to implement this improvement yourself? Follow these steps:
1. Fork this repository on GitHub.
2. Create a new branch for your improvement
3. Implement your improvement, and create tests for it if applicable.
4. Submit a pull request.

## Deployment

1. Make sure [NodeJS](https://nodejs.org) is installed.
2. Set up a MySQL database.
3. Copy all files from this repository.
4. Make sure the Rails environment is set to `production`.
5. Set up the following environment variables:
    * `RAILS_MASTER_KEY`: The master key for decryption of the Rails credentials
    * `DATABASE_NAME`: The name of the MySQL database
    * `DATABASE_USERNAME`: The username for the MYSQL database
    * `DATABASE_PASSWORD`: The password for the MYSQL database
    * `GITHUB_CLIENT_ID`:  The client ID of your GitHub OAuth App (that you will need to create)
    * `GITHUB_CLIENT_SECRET`:  The client secret of the GitHub OAuth App
6. Install all required gems with `bundle install`.
7. Load the database schema with `bin/rails db:schema:load`.
8. Precompile all assets with `bin/rails assets:precompile`.
9. Start the server, e.g., with `bin/rails server`.

Anytime you update the files, you should run `bin/rails db:migrate`, `bin/rails log:clear tmp:clear`, `bin/rails assets:precompile` and then restart the server.

## License
This project is released under the [MIT License](https://opensource.org/licenses/MIT).
