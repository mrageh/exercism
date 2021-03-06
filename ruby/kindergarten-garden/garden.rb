class Garden
  attr_reader :diagram, :students

  DEFAULT_STUDENTS = [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry,
  ]
  MAPPINGS = {
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass,
    "V" => :violets,
  }

  def initialize(diagram, students=DEFAULT_STUDENTS)
    @diagram = diagram
    @students = students
  end

  def method_missing(name, *args, &block)
    all_students = students.sort_by(&:to_s).map(&:downcase).map(&:to_sym)
    index = all_students.index(name)
    lines = diagram.split("\n")

    lines.map do |line|
      line[index*2,2].each_char.map {|letter| MAPPINGS[letter]}
    end.flatten
  end

  def respond_to_missing?(name, include_all)
    respond_to?(name, include_all)
  end
end

