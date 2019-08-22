class Scene
  @@scenes = {}
  @@current_scene_name = nil
  # @@start_time
  # @@end_time
  @@vals = {}

  def self.add(scene_obj, scene_name)
    @@scenes[scene_name.to_sym] = scene_obj
  end


  def self.move_to(scene_name)
    @@current_scene_name = scene_name.to_sym
  end


  def self.play
    @@scenes[@@current_scene_name].play
  end


  def self.draw
    @@scenes[@@current_scene_name].draw
  end

  # def self.getTime
  #   @@start_time = Time.now
  # end
  #
  # def self.setTime
  #   return @@start_time
  # end

  def self.set_val(name, value)
    @@vals[name.to_sym] = value
  end

  def self.get_val(name)
    return @@vals[name]
  end

  def self.scenes
    return @@scenes
  end

  def self.refresh_vals
    return @@vals = {}
  end
end
