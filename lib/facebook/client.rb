module Facebook
  class Client

    def initialize
      @base_url = "https://graph.facebook.com/v2.8"
    end

    def get_user(fb_id)
      JSON.load(get("#{fb_id}", { access_token: ENV["ACCESS_TOKEN"]} ))
    end

    def exchange_token
      options = {
        grant_type:         "fb_exchange_token",
        client_id:          ENV["APP_ID"],
        client_secret:      ENV["APP_SECRET"],
        fb_exchange_token:  ENV["ACCESS_TOKEN"]
      }

      get("/oauth/access_token", options)
    end

    def get(path, options = {})
      conn = Faraday.new(@base_url)
      resp = conn.get(path, options)
      resp.body
    end

  end
end
