# enscript ruby

include_theme("gl-sample")

@lightning_talk_proc_name = "ligntning-gl-sample"
@lightning_talk_as_large_as_possible = false
include_theme("lightning-talk-toolkit")

match(Slide) do |slides|
  slides.each do |slide|
    if slide.lightning_talk?
      slide.lightning_talk
    end
  end
end

