Rails.application.routes.draw do
  use_doorkeeper
  scope PluginRoutes.system_info["relative_url_root"], as: "cama" do
    use_doorkeeper
    namespace :api do
      get 'account' => 'api#account'

      namespace :v1 do
        get 'categories' => 'category#categories'
        get 'posts' => 'post#index'
        get 'pages' => 'page#index'

        scope :contact_form do
          get 'show/:slug' => 'contact_form#contact_form_by_slug'
          post 'create' => 'contact_form#save_form'
        end
      end
    end
  end

  scope PluginRoutes.system_info["relative_url_root"] do
    #Admin Panel
    scope 'admin', as: 'admin' do
      namespace 'plugins' do
        namespace 'camaleon_oauth' do
          get 'index' => 'admin#index'
        end
      end
    end
  end
end