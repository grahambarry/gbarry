class AspectValidator < ActiveModel::EachValidator


def validate
	      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)

          if dimensions.width > dimensions.height
@myAspect = 7
else
	@myAspect = 8
end
return
true
  end
end

