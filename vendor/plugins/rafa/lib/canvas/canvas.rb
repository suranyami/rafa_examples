dirname = File.dirname(__FILE__)
require File.join(dirname, '../util/util')
require File.join(dirname, '../canvas/elements')

module Rafa
  module Elements
   
    # Creates a new +Canvas+ element, yields it and returns the
    # resulting javascript for the block call.
    # This includes everything generated within it.
    def canvas(*args, &block)
      if args.last.kind_of?(Hash)
        options = args.last
        args = args[0...-1]
      else
        options = {}
      end

      # TODO: Is there a way to detect if the block is called inline or
      # is included as erb text?
      c = Canvas.new(*args, &block)
      yield c
      
      wrap_in_script_tag = options.delete(:wrap) || true
      if wrap_in_script_tag
        javascript_tag(c.contents.join("\n"))
      else
        c.contents.join("\n")
      end
    end
    
    # Class that represents the raphael +canvas+ element.
    class Canvas
      include Rafa::Util

      attr_accessor :dom_element, :contents, :name, :width, :height

      # Initializes the canvas element. It takes the same parameters as the raphael
      # +canvas+ element: four integers representing starting point, width and height,
      # or a string and two integers, representing the id of the DOM holder, width and height
      def initialize(*args, &block)
        is_integer = Proc.new{|i| i.kind_of? Integer}
        if args[0].kind_of? Symbol or args[0].kind_of? String
          @dom_element = args[0].to_s
          raise BadConstructorException(args[1,2]) unless args[1, 2].all?(&is_integer)
          @width, @height = args[1, 2]
          raphael_arguments = args[0, 3]
        else
          raise BadConstructorException(args[1,2]) unless args[0, 4].all?(&is_integer)
          @width, @height = args[2, 2]
          raphael_arguments = args[0, 4]
        end
        constructor_args = raphael_arguments.map(&:to_json).join(", ")
        constructor = "new Raphael(#{constructor_args})"
        @contents = []
        @name = "rafa_canvas_" + uid_suffix
        self << "var #{@name} = #{constructor};"
      end

      # Generates a +Circle+ object
      def circle(*args)
        Circle.new(self, *args)
      end

      # Generates a +Rect+ object
      def rect(*args)
        Rect.new(self, *args)
      end

      # Generates an +Ellipse+ object
      def ellipse(*args)
        Ellipse.new(self, *args)
      end

      # Generates a +Text+ object
      def text(*args)
        Text.new(self, *args)
      end
      
      # Generates a +Bar+ chart object
      def barchart(*args)
        Bar.new(self, *args)
      end
      
      # Generates a +Bar+ chart object
      def hbarchart(*args)
        HBar.new(self, *args)
      end
      
      # Generates a +Dot+ chart object
      def dotchart(*args)
        Dot.new(self, *args)
      end
      
      # Generates a +Line+ chart object
      def linechart(*args)
        Line.new(self, *args)
      end
      
      # Generates a +Pie+ chart object
      def piechart(*args)
        Pie.new(self, *args)
      end
      
      # Generates a +Path+ object. It yields itself if given a block.
      def path(*args, &block)
        Path.new(self, *args, &block)
      end

      # Injects a string directly into javascript output.
      # Used by elements to output its generation code, or can be used externally to
      # inject external javascript code
      def << js
        raise TypeError("String required") unless js.kind_of? String
        @contents << js
      end

    end
    
  end
end
