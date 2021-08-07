class AppDashboardController < ApplicationController
  def index
    ActionCable.server.broadcast("csv_#{current_user.id}", { body: "Dashboard index" })    
  end

  def data
    products_db = Product.all
  end

  def process_data
    ActionCable.server.broadcast("csv_#{current_user.id}", { body: "Before Process data enqueue" })
    CsvExportJob.perform_later(current_user.id, Product.all.to_a)
    ActionCable.server.broadcast("csv_#{current_user.id}", { body: "Process Data enqueue" })
    #redirect_to({ action: "data" }, notice: "Export processing on data")
    render json: "ok"
  end

  def stream_csv
    send_file File.join(Rails.root, "tmp", Rails.env, "toto#{current_user.id}.csv")
  end
end
