require 'json'

module Jekyll

  class OrderPage < Page
    def initialize(site, base, dir, order)
      @site = site
      @base = base
      @dir = dir
      @name = "#{order['id']}/index.html"

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'order.html')
      self.data['order'] = order
    end
  end

  class Site
    def read_data_object( filename )
 
      data_dir = self.config['data_dir'] || '_data'
      data_path = File.join(self.config['source'], data_dir)
      if File.symlink?(data_path)
        return "Data directory '#{data_path}' cannot be a symlink"
      end
      file = File.join(data_path, filename)
 
      return "File #{file} could not be found" if !File.exists?( file )
      
      result = nil
      Dir.chdir(data_path) do
        result = File.read( filename )
      end
      puts "## Error: No data in #{file}" if result.nil?
      # puts result
      result = JSON.parse( result ) if result
      { 'data' => result,
        'mtime' => File.mtime(file) }
    end
  end

  class OrderPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'order'
        dir = site.config['orders_dir'] || 'order'
        # data_hash = site.read_data_object( "orders.json" )
        # orders = data_hash['data']
        for order in site.data['orders']
          site.pages << OrderPage.new(site, site.source, dir, order)
        end
      end
    end
  end

end