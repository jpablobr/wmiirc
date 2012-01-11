# tags.yaml:control:event:FocusTag:1:in `new'

## 1: Try to create tag.
~/.wmii/display/tags.yaml:43
    tags.each {|t| event 'CreateTag', t }

## 2: `control:event:CreateTag`
~/.wmii/display/tags.yaml:26
    CreateTag: |
      TagBarlet.new(argv[0]) rescue nil

## 3: `script:before`
~/.wmii/display/tags.yaml:8
    class TagBarlet < Barlet
        def initialize tag
          super tag, :left
          self.label = tag
       end
    end

## 4: `script:before`
~/.wmii/display/barlet.yaml:4
    class Barlet < Rumai::Barlet
       def initialize *args
          super

          unless exist?
            create
            self.colors = 'normal'
          end
        end

        def colors= key
          super CONFIG['display']['color'][key] || key
        end
    end

## 5: `Node::Barlet#initialize`
~/.wmii/rumai/lib/rumai/wm.rb:1135
    def initialize file_name, side
      prefix =
        case @side = side
        when :left then '/lbar'
        when :right then '/rbar'
        else raise ArgumentError, side
        end
      super "#{prefix}/#{file_name}"
    end

## 6: `Node#initialize`
~/.wmii/rumai/lib/rumai/fs.rb:32
    class Node
      attr_reader :path

      def initialize path
        @path = path.to_s.squeeze('/')
      end

## 7: `Rumai::IXP::Agent#recv`
~/.wmii/rumai/lib/rumai/ixp/transport.rb:112

## 8: `msg = Fcall.from_9p(@stream)`
~/.wmii/rumai/lib/rumai/ixp/transport.rb:151

## 9: `Rumai::IXP::Fcall#from_9p`
~/.wmii/rumai/lib/rumai/ixp/message.rb:419
    def from_9p stream
      size = stream.read_9p(4)
      type = stream.read_9p(1)
     
      puts "DBG: fcall=#{fcall.inspect}"
     
      unless fcall = TYPE_TO_CLASS[type]
        raise Error, "illegal fcall type: #{type}"
      end
     
      __from_9p__ stream, fcall
    end

`Rumai::IXP::Struct#from_9p`
~/.wmii/rumai/lib/rumai/ixp/message.rb:125
    def from_9p stream, msg_class = self
      msg = msg_class.new
      msg.load_9p(stream)
      msg
    end

Rumai::IXP::Rerror
# Error:
    E, [2012-01-10T12:34:06.099750 #7852] ERROR -- : file not found -- in reply to #<Rumai::IXP::Twalk:0x8953fb4 @fields=[#<Rumai::IXP::Struct::Field:0x81cad24 @name=:tag, @format=2, @countee=nil, @counter=nil>, #<Rumai::IXP::Struct::Field:0x81c4190 @name=:fid, @format=4, @countee=nil, @counter=nil>, #<Rumai::IXP::Struct::Field:0x81c3948 @name=:newfid, @format=4, @countee=nil, @counter=nil>, #<Rumai::IXP::Struct::Field:0x81c32cc @name=:nwname, @format=2, @countee=#<Rumai::IXP::Struct::ClassField:0x81c2afc @name=:wname, @format=String, @countee=nil, @counter=#<Rumai::IXP::Struct::Field:0x81c32cc ...>>, @counter=nil>, #<Rumai::IXP::Struct::ClassField:0x81c2afc @name=:wname, @format=String, @countee=nil, @counter=#<Rumai::IXP::Struct::Field:0x81c32cc @name=:nwname, @format=2, @countee=#<Rumai::IXP::Struct::ClassField:0x81c2afc ...>, @counter=nil>>], @values={:fid=>0, :newfid=>8, :wname=>["lbar", "1"], :tag=>5}> (Rumai::IXP::Error)
    home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:161:in `block in recv'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:124:in `loop'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:124:in `recv'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:179:in `talk'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:458:in `walk_fid'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:446:in `walk'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:213:in `open'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/ixp/transport.rb:382:in `write'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/fs.rb:117:in `write'
    /home/jpablobr/.wmii-hg/rumai/lib/rumai/wm.rb:1178:in `label='
    /home/jpablobr/.wmii-hg/display/tags.yaml:script:before:4:in `initialize'
    /home/jpablobr/.wmii-hg/display/tags.yaml:control:event:FocusTag:1:in `new'
    /home/jpablobr/.wmii-hg/display/tags.yaml:control:event:FocusTag:1:in `block (3 levels) in control'
    /home/jpablobr/.wmii-hg/lib/wmiirc/handler.rb:20:in `call'
    /home/jpablobr/.wmii-hg/lib/wmiirc/handler.rb:20:in `block in handle'
    /home/jpablobr/.wmii-hg/lib/wmiirc/handler.rb:19:in `each'
    /home/jpablobr/.wmii-hg/lib/wmiirc/handler.rb:19:in `handle'
    /home/jpablobr/.wmii-hg/lib/wmiirc/handler.rb:38:in `event'
    /home/jpablobr/.wmii-hg/display/tags.yaml:script:after:4:in `block in script'
    /home/jpablobr/.wmii-hg/lib/wmiirc/config.rb:38:in `instance_eval'
    /home/jpablobr/.wmii-hg/lib/wmiirc/config.rb:38:in `block in script'
    /home/jpablobr/.wmii-hg/lib/wmiirc/config.rb:37:in `each'
    /home/jpablobr/.wmii-hg/lib/wmiirc/config.rb:37:in `script'
    /home/jpablobr/.wmii-hg/lib/wmiirc/config.rb:17:in `apply'
    /home/jpablobr/.wmii-hg/lib/wmiirc/loader.rb:118:in `load_user_config'
    /home/jpablobr/.wmii-hg/lib/wmiirc/loader.rb:23:in `run'
    /home/jpablobr/.wmii-hg/wmiirc:6:in `<main>'
    I, [2012-01-10T12:34:20.954076 #7852]  INFO -- : stop
