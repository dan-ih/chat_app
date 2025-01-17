# app/controllers/manifests_controller.rb
class ManifestsController < ApplicationController
  def show
    # Define your manifest data here or render a template.
    render json: {
      name: "My App",
      short_name: "App",
      start_url: "/",
      display: "standalone",
      background_color: "#ffffff",
      theme_color: "#000000",
      icons: [
        {
          src: "/icon.png",
          sizes: "192x192",
          type: "image/png"
        }
      ]
    }
  end
end

