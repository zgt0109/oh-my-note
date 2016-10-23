#### rails new beijing -T -B -d mysql

#### config/application.rb
	config.generators.assets = false
	config.generators.assets = false
	
#### rails g scaffold Book title number amount
  
  
#### Add Semantic Gem
	gem 'semantic-ui-sass', '~> 2.2', '>= 2.2.4.0'
	@import 'semantic-ui';
	//= require semantic-ui
	class: "ui button primary"
	
#### Add Annotate Gem
	gem 'annotate', '~> 2.7', '>= 2.7.1'
	rails g annotate:install
	
#### Add seedbank Gem
	gem 'seedbank', '~> 0.4.0'
	db/seeds/development/books.seeds.rb
	
#### Add livereload Gem
	gem 'rack-livereload', '~> 0.3.16'
  	gem 'guard-livereload', '~> 2.5', '>= 2.5.2'
  	guard init livereload
  	config/environments/development.rb
  	config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload
  	bundle exec guard

#### Add ERD Gem
	gem 'rails-erd', '~> 1.5'
	brew install graphviz / sudo apt-get install graphviz
	erd 生成erd.pdf
	open erd.pdf
#### Add Paranoia Gem
	gem 'paranoia', '~> 2.2.0.pre'
	rails generate migration AddDeletedAtToBooks deleted_at:datetime:index
	acts_as_paranoid
	
#### Add I18N Gem
	gem 'rails-i18n', '~> 5.0', '>= 5.0.1'
	config/initializers/locale.rb
	Rails.application.config.i18n.load_path += Dir[Rails.root.join('config',  'locales', '**', '*.{rb,yml}')]
    Rails.application.config.i18n.available_locales = ['zh-CN', :en]
    Rails.application.config.i18n.default_locale = 'zh-CN'

zh-CN.yml

```
zh-CN:
  books:
    index:
      options: '操作'
  activerecord:
    models:
      book: '书籍'
      user: '用户'
    attributes:
      book:
        title: '标题'
        number: '编号'
        amount: '金额'
      user: 
        name: '名字'
        password: '密码'
```
        
#### Add User model
	rails g scaffold User name password:digest
	rails g migration AddUserToBook user:references
	rails db:migrate
	