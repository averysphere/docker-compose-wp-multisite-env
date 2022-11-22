# Wordpress Development Environment (LAMP Stack) Multisite Ready #

## How to run and build ##

Run this using `docker compose up --build` and let Docker run the build. You may use `docker-compose` instead. Take note of the hyphen.

Run `docker compose run --rm wp core download` to download the latest version of Wordpress. Make sure your `wordress` directory in this environment is writable by the Docker `wp` instance.

## How to enable multisite ##

1. Once the Wordpress core files are downloaded, go to your browser and access `http://localhost` to start the Wordpress setup.
2. Once setup is successful, you will see a `wp-config.php` file created for you under the `wordpress` directory.
3. Edit the file and add the line `define( 'WP_ALLOW_MULTISITE', true );` just above the line that says `/* Add any custom values between this line and the "stop editing" line. */`.
4. Save and go back to your Wordpress install in your browser and access the admin dashboard.
5. Go to **Tools > Network Setup** and follow the instructions. Also, for this environment, it is advisable to use the subdirectory setup. This will be the default, too.

## Why Apache and not Nginx? ##

Wordpress works in Nginx as demonstrated in our previous WP Docker environment. However, for multisite, using Apache is more straightforward. Additionally, Wordpress is more or less designed and optimized for Apache as the web server.

## Tips ##

When cloning, specify a directory to separate clearly this environment from your previous one. You can run `git clone https://github.com/averysphere/docker-compose-wp-multisite-env.git wordpress-multisite` to have the files in this repo copied to the directory `wordpress-multisite`.

## Questions still? ##

Send me an email at `harveyentendezdiaz AT gmail DOT com`.

