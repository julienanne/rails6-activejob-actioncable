class CsvExportJob < ApplicationJob
  queue_as :default

  after_perform :notify

  def perform(current_user_id, products_db)
    products = products_db.map do |p| 
      { name: p.name, price_with_discount: p.price-(p.price*p.percent_discount/100) }
    end    
    products = products.sort_by { |p| p[:name] }
    File.open(File.join(Rails.root, "tmp", Rails.env, "toto#{current_user_id}.csv"), "w") do |f|
      products.each do |p|
        f.puts "#{p[:name]},#{p[:price_with_discount]}"
      end
    end

    lines = File.readlines(File.join(Rails.root, "tmp", Rails.env, "toto#{current_user_id}.csv"))
    if lines.count == products_db.count
      lines.each do |line|
        product = Product.find_by_name(line.split(",")[0])
        raise Exception if product.nil?
      end
    end
  end

  private
    def notify
      ActionCable.server.broadcast("csv_#{@arguments[0]}", { body: "Task completed lien", a: "/app_dashboard/stream_csv" })
    end
end
