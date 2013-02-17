Clams::Application.routes.draw do
  # Access API description at /api_taster
  mount ApiTaster::Engine => "/api_taster" if Rails.env.development?

  resources :user do
    resources :statuses
    resources :comments
    resources :subscriptions
    resources :groups
    resources :posts
  end

  resources :posts do
    resources :comments
  end

  resources :groups do
    resources :subscriptions
    resources :users
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

if Rails.env.development?
  ApiTaster.routes do
      # users
      desc 'Get a __list__ of users'
      get '/users'

      desc "Create a new user"
      post '/users', {
        :user => {
          :name => 'Susie',
          :email => "susie@aol.com"
        }
      }

      desc "Get an individual user"
      get '/users/:id', {
        :id => 1
      }

      desc "Update an individual user"
      put '/users/:id', {
        :id => 1, :user => {
          :name => "Jane",
          :email => 'susieq@gmail.com'
        }
      }

      desc "Delete a user"
      delete '/users/:id', {
        :id => 1
      }

      # comments
      desc 'Get a __list__ of comments'
      get '/comments'

      desc "Create a new comment"
      post '/comments', {
        :comment => {
          :content => 'Some Text',
        }
      }

      desc "Get an individual comment"
      get '/comments/:id', {
        :id => 1
      }

      desc "Update an individual comment"
      put '/comments/:id', {
        :id => 1, :comment => {
          :content => 'New Text'
        }
      }

      desc "Delete a comment"
      delete '/comments/:id', {
        :id => 1
      }

      # groups
      desc 'Get a __list__ of groups'
      get '/groups'

      desc "Create a new group"
      post '/groups', {
        :group => {
          :name => 'Developers of the World',
          :motto => "Hack the Planet"
        }
      }

      desc "Get an individual group"
      get '/groups/:id', {
        :id => 1
      }

      desc "Update an individual group"
      put '/groups/:id', {
        :id => 1, :group => {
          :name => "Atari Appreciation",
          :motto => 'All your base are belong to us'
        }
      }

      desc "Delete a group"
      delete '/groups/:id', {
        :id => 1
      }

      # posts
      desc 'Get a __list__ of posts'
      get '/posts'

      desc "Create a new post"
      post '/posts', {
        :post => {
          :title => 'Super Sweet Post',
          :content => "I am the best writer"
        }
      }

      desc "Get an individual post"
      get '/posts/:id', {
        :id => 1
      }

      desc "Update an individual post"
      put '/posts/:id', {
        :id => 1, :post => {
          :title => "Humble beginnings",
          :content => 'Writing is hard'
        }
      }

      desc "Delete a post"
      delete '/posts/:id', {
        :id => 1
      }

      # statuses
      desc 'Get a __list__ of statuses'
      get '/statuses'

      desc "Create a new status"
      post '/statuses', {
        :status => {
          :content => 'Sleepy....ZZzZzZ',
        }
      }

      desc "Get an individual status"
      get '/statuses/:id', {
        :id => 1
      }

      desc "Update an individual status"
      put '/statuses/:id', {
        :id => 1, :status => {
          :content => 'Caffeine Rocks!'
        }
      }

      desc "Delete a status"
      delete '/statuses/:id', {
        :id => 1
      }

      # subscriptions
      desc 'Get a __list__ of subscriptions'
      get '/subscriptions'

      desc "Create a new subscription"
      post '/subscriptions', {
        :subscription => {
          :renew_date => DateTime.now,
        }
      }

      desc "Get an individual subscription"
      get '/subscriptions/:id', {
        :id => 1
      }

      desc "Update an individual subscription"
      put '/subscriptions/:id', {
        :id => 1, :subscription => {
          :renew_date => DateTime.now
        }
      }

      desc "Delete a subscription"
      delete '/subscriptions/:id', {
        :id => 1
      }
  end
end
