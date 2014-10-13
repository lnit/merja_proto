module Merja
  require 'merja/pathname'

  class ForbiddenError < StandardError ; end
  class NotFoundError < StandardError ; end

  class << self
    def survey(path)
      target = target_pathname(path)
      target = sanitize!(target)

      raise NotFoundError unless target.exist?
      collect_children(target)
    end

  private
    def target_pathname(path)
      ::Pathname.new(accessible_dir + path)
    end

    def sanitize!(pathname)
      cleanpath = pathname.cleanpath
      raise ForbiddenError if cleanpath.to_s !~ %r(^#{accessible_dir.cleanpath.to_s})
      cleanpath
    end

    def collect_children(target)
      target.children.map do |pathname|
        pathname.to_merja
      end.compact
    end

    # TODO: configurable
    def accessible_dir
      Rails.root + "public/"
    end
  end
end

class Pathname
  # TODO: 非対応拡張子でもとりあえず何か返せるように
  def to_merja
    return unless extname = self.extname.presence

    klass = "Merja::Pathname::#{extname.classify}".constantize
    klass.new(self)

  rescue NameError
    nil
  end
end
