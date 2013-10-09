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
    
  end

  a, b = read_matrices('datos.dat')
  
  #Tamaño matriz cuadrada
  tam = a.length 

puts "-----------Suma------------"
#SUMA 	
  s = Array.new
  for k in (0...tam) do	
	for x in (0...tam) do s[x] = a[k][x]+b[k][x] 
	puts s[x]
	end
   end
puts "------Multiplicacion--------"
#MULTIPLICACION
  z = Array.new
  z = 0
  for k in (0...tam) do
	for x in (0...tam) do
		for j in (0...tam) do 
			z += a[k][j]*b[j][x]
                end
        puts z
        z = 0
	end
  end


