class TextFieldFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TextHelper


  def div_radio_button(method, tag_value, options = {})
    @template.content_tag(:div,
      @template.radio_button(
        @object_name, method, tag_value, objectify_options(options)
      )
    )
  end

  def text_field_with_label(label, attribute, placeholder=nil, options={})
  	@template.content_tag :div, class: 'form-group-with-height' do
  		label = @template.content_tag(:label, label, class: 'col-sm-2 control-label')
  		input = @template.content_tag(:div, class: 'col-sm-10') do
  			@template.text_field_tag(attribute, @object.send(attribute), placeholder: placeholder, class: 'form-control')
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
          (@template.text_field_tag(ele, @object.send(ele), placeholder: ele.to_s.humanize.titleize, class: 'form-control')),
          class: "col-sm-#{percentage[i]}"))
      end
    end
  end

  def password_field_with_label(label, attribute, placeholder=nil, extra=nil, options={}, &block)

    @template.content_tag :div, class: 'form-group-with-height' do
      @template.concat @template.content_tag(:label, label, class: 'col-sm-2 control-label')
      @template.concat(@template.content_tag(:div, class: 'col-sm-10') do
        @template.concat @template.password_field_tag(attribute, @object.send(attribute), placeholder: placeholder, class: 'form-control')
        @template.concat @template.content_tag(:i, extra)
        @template.concat @template.capture(&block) if block_given?
      end)
    end
  end

  # def text_field_without_label(method, tag_value, options={})
  # 	@template.content_tag :div, css: 'form-group-with-height' do
  # 		@template.text_field method, tag_value, {css: 'form-control'}
  # 	end	
  # end
end
