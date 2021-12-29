# Trullo Backend
Trullo backend is a project developed using Ruby on Rails.

## Requirements

* Ruby version 3.0.0
* Node.js version 14.15.4
* Rails version 6.1.4
* Yarn version 1.22.5
* PostgreSQL


## Getting Started
To run this project on ubuntu
### Linux installation

- #### Install system dependencies
   The following dependencies are need to build the project. Type in your terminal de following commands to install:

     ```bash
     $ sudo apt-get update
     $ sudo apt-get install cmake
     $ sudo apt-get install pkg-config
     ```


- #### Install Node.js for Linux
	 Installing Node.js can be done in several ways, for example the most common is using `apt-get`:

     ```bash
     $ sudo apt-get install nodejs
     ```

     However using this command you wont be able to select a specific version for project, we need to use the **node.js version 14.15.4**, we encourage the use of a node version manager, for instance, [volta](https://volta.sh/) (to learn more about this tool check the link):

	```bash
    # Install Volta
    $ curl https://get.volta.sh | bash
	```

	> **You need to reopen your terminal to installation changes be applied and the volta commands can be recognized for node installation.**

	Install node with volta:

	```bash
	# Install Node
	$ volta install node@14.15.4

	# Check Node version
	$ node -v
	```
- #### Install pre-commit gem for Linux

	```bash
	$ gem install pre-commit
	```

	If you use **`rvm`** run the following command:

	```
	$ rvm default do gem install pre-commit
	```

- #### Install Database for Linux
    Before continue creating the database, you might get an error creating it due to postgres, to avoid that we are going to install the PostgreSQL database and configure a user to manage it.

	The first thing you must do is configure the repositories lists:

	```bash
	$ wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	$ echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list -
	$ sudo apt update -
	```

	Once the list of PostgreSQL packages is updated we will use the following command to install it:

	```bash
	$ sudo apt -y install postgresql-12 postgresql-client-12
	```

	Once PostgreSQL is installed, we will enter the session and create from there a new user with the ability to create databases:

    ```
    $ sudo -i -u postgres
    $ createuser --pwprompt --interactive (enter here the user name with out  () )
    $ Enter password for new role: ****** (your password)
    $ Enter it again: ******
    $ Shall the new role be a superuser? (y/n) y
    ```

    Make sure to save the **user** and **password** for later configurations, we will need that information laterTo exit the PostgreSQL session we must use the `exit` command.`
### Final installation steps

- #### Install Bundler and Rails

	Run the following commands to install:

	```bash
	# Install Bundler
	$ gem install bundler

	# Install Rails (this project use rails 6.1.4)
	$ gem install rails -v 6.1.4
	```

	**If you use Rbenv**, in order to use the `rails` and `bundle` executables, you need to tell `rbenv` to see it:

	```bash
	$ rbenv rehash
	```

	Now you can verify Rails and Bundler are installed:

	```bash
	$ bundler -v
	# Bundler version

	$ rails -v
	# Rails 6.1.4
	```

- #### Clone repository
	Clone this repository to your local machine to finalize the file configurations. You must **have [Git](https://git-scm.com/) installed and configured** before this step.

	Type this in your terminal to clone the repo:

	```bash
	$ git clone https://github.com/juanfer2/trullo_backend
	```
- #### Install app dependencies
    Make sure you have the correct version of ruby installed before running `bundle install` or it will generate errors.

    ```bash
    # Go to the cloned project directory
	$ cd trullo_backend

	# Setup pre-commit gem in your git repo
    $ pre-commit install

	# Install dependencies
    $ bundle install
    ```
- #### Setup config files

	We have include a Makefile file where there are useful commands for running steps quickly, e.g., the following command will do all the following setup steps of copying `database.yml`

	```bash
	$ make copy-config
	```
- #### Create DB and execute migrates, views and seeds (Not required if you have a db backup)

	First don't forget go to `config/database.yml` file and set the **username** & **password** that you created before for postgres in `development` and `test` configs, then,  execute commands below:

	```
	$ rails db:create
	$ rails db:migrate
	$ rails db:seed
	```

- #### Config front-end libraries

	Run the command and write n in all options
	
	```
	$ bundle exec rails webpacker:install
	```

- #### Run the webserver

	```
	$ rails s -p 3000
	=> Booting Puma
	=> Rails 6.1.4 application starting in development
	=> Run `bin/rails server --help` for more startup options
	Puma starting in single mode...
	* Puma version: 5.3.1 (ruby 3.0.0-p137) ("Sweetnighter")
	*  Min threads: 0
	*  Max threads: 5
	*  Environment: development
	*          PID: 74700
	* Listening on http://127.0.0.1:3000
	* Listening on http://[::1]:3000
	Use Ctrl-C to stop
	```

Now **everything has been installed**, you can jump to [How to access to the web server section](#how-to-access-to-the-web-server).
