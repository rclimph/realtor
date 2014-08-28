module CustomFormsHelper
  def normal_field(f, obj, label)
    return (f.input obj, :placeholder => label, :label => label, class: "form-control")
  end
  
  def checkbox_normal_field(f, checkbox_obj, field_obj, label_obj)
    render :partial => 'shared/checkbox_field', :locals => { :f => f, :checkbox_obj => checkbox_obj, :field_obj => field_obj, :label_obj => label_obj } 
  end
  
  def country_select_field(f, obj, label)
    return f.input obj, title: label, :label => label, :data => { :style => 'btn-default'}
  end
  
  def select_field(f, obj, collect, selected)
    return f.input obj, class: "selectpicker", :collection => collect, title: selected, :data => { :style => 'btn-default'}
  end
  
  def datepicker_field(f, obj, label)
    return f.input obj, as: :string, class: "form-control", :placeholder => label, :input_html => { :data => { :behaviour => 'datepicker'} }
  end
  
  def radio_buttons_inline(f, obj, collect, label)
    return f.input obj, as: :radio_buttons, :label => label, :collection => collect, wrapper: :vertical_radio_and_checkboxes
  end
  
  def show_label_val(label_col, val, is_even)
    # Shows a label with its value field within a show.html.haml page in its own row
    render :partial => 'shared/label_field', :locals => { :label_col => label_col, :val => val, :is_even => is_even }
  end
  
  def show_label_date(label_col, val, is_even)
    # Shows a label with its value DATE field within a show.html.haml page in its own row
    render :partial => 'shared/label_date', :locals => { :label_col => label_col, :val => val, :is_even => is_even }
  end
end
