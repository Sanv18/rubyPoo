#1.	Desarrolle un programa que permita a una función recursiva ordenar de menor a 
#mayor un arreglo de enteros. Para ello deberá colocar el elemento más pequeño en 
#la primera ubicación, y luego ordene el resto del arreglo con una llamada recursiva.

def arreglo(f)
v=[] 
c = 0 
until c == f
    puts 'introduce un numero' 
    x = gets 
    n = x.to_i 
    v.push(n) 
    c += 1  
end
 
puts "vector sin ordenar : " 
for i in v 
    print "#{i} " 
end 
puts ' '     
 
limit = (v.length-1)  
while limit > 0 
    for i in 0...limit 
        if v[i+1]  <  v[i] 
           aux = v[i] 
           v[i] = v[i+1] 
           v[i+1] = aux      
        end     
    end     
    limit -= 1      
end 
 
puts "vector ordenado" 
 
for i in v 
    print "#{i} " 
end 
puts ' ' 

end 

puts "ingrese cantidad de enteros"
 f = gets.to_i
puts arreglo(f)


#Sandy I. Valdivia