module ApplicationHelper
  def apresenta_data_formatada(data_str, data)
    unless data.nil?
      formatar_data(data)
    else
      data_str unless data_str.nil?
    end
  end
  
  def formatar_data(data)    
    data.strftime("%d/%m/%Y") unless data.nil?
  end
end
