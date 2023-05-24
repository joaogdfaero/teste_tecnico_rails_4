require 'csv'

module Api
    module v1
        class NetflixesController < ApplicationController
            before_action :set_netflix, only: %i[show update destroy]

            # GET /netflixes
            def index
                @netflixes = Netflix.all

                render json: @netflixes
            end
            
            # GET /netflixes/1
            def show
                @netflix = Netflix.find(params[:id])
                render json: {status: 'SUCCESS', message: 'Loaded Netflix Title', data:@netflix}, status: :ok  
            end

            # POST /netflixes
            def create
              @netflix = Netflix.new(netflix_params)
              
              if @netflix.save
                render json: {status: 'SUCCESS', message: 'Saved Netflix', data:@netflix}, stauts: :ok
              else
                render json: {status: 'ERROR', message: 'Netflix not saved', data:@netflix.errors}, status: :unprocessable_entity
              end
            end

            # PATCH/PUT /netflixes/1
            def update
                if @netflix.update(netflix_params)
                    render json: {status: 'SUCCESS', message: 'Updated Netflix', data:@netflix}, stauts: :ok
                else
                    render json: {status: 'ERROR', message: 'Netflix not updated', data:@netflix.errors}, status: :unprocessable_entity
            end

            # DELETE /titles/1
            def destroy
                @netflix = Netflix.find(params[:id])
                @netflix.destroy
                render json: {status: 'SUCCESS', message: 'Deleted Netflix', data:@netflix}, stauts: :ok
            end

            # IMPORT CSV
            def import_csv
                errors = []

                CSV.foreach(params[:csv].path, headers: true) do |row|
                    begin
                        Netflix.create( show_id: row[0], type_title: row[1], title: row[2], director: row[3], cast: row[4],
                      country: row[5], date_added: row[6], release_year: row[7], rating: row[8], duration: row[9],
                      listed_in: row[10], description: row[11])
                    
                    rescue Exception => errors
                        errors << err.message
                    end

                if errors.blank?
                    render json: { first_message: "Arquivo CSV importado com sucesso!" }, status: :ok
                else
                    render json: { first_message: errors.join(', ') }, status: :unprocessable_entity
                end
                end
            end

            private
            # Use callbacks to share common setup or constraints between actions.
            def set_title
                @netflix = Netflix.find(params[:id])
            end

            # Only allow a list of trusted parameters through.
            def netflix_params
                params.require(:netflix).permit(:id_csv, :genre, :title, :director, :cast, :country,
                                                :published_at, :year, :rating, :duration, :listed_in, :description)
            end 
        end
    end
end
