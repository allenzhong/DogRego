class TextFieldFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TextHelper


  def text_field_with_label(label, attribute, placeholder=nil, options={})
  	@template.content_tag :div, class: 'form-group-with-height' do
  		label = @template.content_tag(:label, label, class: 'col-sm-2 control-label')
  		input = @template.content_tag(:div, class: 'col-sm-10') do
  			self.text_field(attribute, { placeholder: placeholder, class: 'form-control' })
			end

      label + input
  	end
  end

  def text_fields_with_label(label, attributes, percentage=nil, options={})
    style = "small-#{attributes.length}x-row"
    @template.content_tag :div, class: "form-group-with-height #{style}" do
      @template.concat @template.content_tag(:label, label, class: 'col-sm-2 control-label')

      attributes.map.with_index do |ele,i|
        @template.concat(@template.content_tag(:div,
          (self.text_field(ele, { placeholder: ele.to_s.humanize.titleize, class: 'form-control'})),
          class: "col-sm-#{percentage[i]}"))
      end
    end
  end

  def password_field_with_label(label, attribute, placeholder=nil, extra=nil, options={}, &block)
    @template.content_tag :div, class: 'form-group-with-height' do
      @template.concat @template.content_tag(:label, label, class: 'col-sm-2 control-label')
      @template.concat(@template.content_tag(:div, class: 'col-sm-10') do
        @template.concat self.password_field(attribute, { placeholder: placeholder, class: 'form-control'})
        @template.concat @template.content_tag(:i, extra)
        @template.concat @template.capture(&block) if block_given?
      end)
    end
  end

  def date_picker(label, attribute, options={})
    @template.content_tag :div, class: 'form-group-with-height' do
      @template.concat @template.content_tag(:label, label, class: 'col-sm-2 control-label')
      @template.concat(@template.content_tag(:div, class: 'col-sm-10') do
        @template.concat(@template.content_tag(:div, {id: 'datepicker', class: 'input-group date'}) do
          @template.concat self.text_field(attribute, { class: 'form-control' })
          @template.concat(@template.content_tag(:span, class: 'input-group-addon') do
            @template.concat @template.content_tag(:span, nil, class: 'glyphicon glyphicon-calendar')
          end)
        end)
      end)
      @template.concat(@template.javascript_tag(datepicker_javascript))
    end
  end

  def submit_with_style(attribute, options={})
    @template.content_tag :div, class: 'form-group-with-height actions' do
      @template.content_tag :div, class: 'col-sm-offset-2 col-sm-2 col-xs-12' do
        self.submit(attribute, options.merge({class: 'btn btn-success btn-block'}))
      end
    end 
  end
  
  # def text_field_without_label(method, tag_value, options={})
  # 	@template.content_tag :div, css: 'form-group-with-height' do
  # 		@template.text_field method, tag_value, {css: 'form-control'}
  # 	end	
  # end
  private

  def datepicker_javascript
    <<-JS
      $(function () {
        $('#datepicker').datetimepicker({
          format: 'DD/MM/YYYY'
        });
      });
    JS
  end
end
