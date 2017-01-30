class Importer
	def initialize(user)
		@current_user = user
	end
	def import file
	  spreadsheet = open_spreadsheet(file)
	  header = spreadsheet.row(1)
	  (2..spreadsheet.last_row).each do |i|
	  	puts i
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    row["account"] = @current_user.user_configuration.account
	    category_name = row["category"]
	    row["category"] = findCategory row["category"], row["type"]
	    if !row["category"]
	    	row["category"] = createCategory category_name, row["type"]
	    end
	    year, day, month = row["when"].split("/").reverse.map {|i| i.to_i }
	    row["when"] = Time.new year, month, day
	    Transaction.create! row
	  end
	end

	def open_spreadsheet file
	  case File.extname(file.original_filename)
	   when '.csv' then Roo::CSV.new(file.path, csv_options: {:col_sep => ','})
	   when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
	   when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
	   else raise "Unknown file type: #{file.original_filename}"
	  end
	end

	private
	def findCategory category, type
		case type
		when "Income"
			Icategory.where(:name => category, :user => @current_user).first
		when "Expense"
			Ecategory.where(:name => category, :user => @current_user).first
		end
	end
	def createCategory category, type
		case type
		when "Income"
			Icategory.create!(:name => category, :user => @current_user)
		when "Expense"
			Ecategory.create!(:name => category, :user => @current_user)
		end
	end
end