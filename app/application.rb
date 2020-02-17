class Application
   
    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new

        if req.path.match(/items/)

            item_choice = req.path.split("/items/").last
            if 
                item = @@items.find{ |ite| ite.name == item_choice}
                resp.write item.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        elsif 
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end