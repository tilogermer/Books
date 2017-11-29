module StatisticsHelper
	def authors_by_country
		column_chart authors_by_country_statistics_path, height:'300px', library:{
			title:{text:'Authors by country', x: -20},
			yAxis: {
				title:{
					text:'Authors count'
				}
			},
			xAxis: {
				title:{
					text: 'Country'
				}
			},
			colors: ['red']
		}
	end


  

end
