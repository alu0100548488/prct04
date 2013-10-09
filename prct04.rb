#!/usr/bin/ruby1.9

  def mapmap(a)
    a.map { |r| 
      r.map { |e| 
        yield e
      }
    }
  end

  def to_m(a)
    a = a.split(/\n/)
    a = a.map { |r| r.split(/\s+/) }
    a = mapmap(a) { |x| x.to_f } 
  end

  def read_matrices(fn)
    text = File.open(fn).read

    a, b = text.split(/\n\n+/)
    a = to_m(a)
    b = to_m(b)

    [a, b]
    
    puts a
    puts b
  end
