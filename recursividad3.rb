#Desarrollar un programa que reciba el número de niveles 
#(por ejemplo en la imagen el triángulo sería de nivel 6) 
#y usando recursividad muestre el triángulo de Pascal. Deberá mostrarse en forma triangular. 
def pascal(n) 
    v =[] 
    p =[] 
    c = 0 
    while c <= n 
      if p.size <2  
            p.push(1) 
            v.push(1) 
            imprimir(p) 
            c +=1 
        else  
                for i in 0..v.size-1 
                    if i == 0 
                        v[i] = v[i] 
                    else v[i] = p[i-1] + p[i]      
                    end 
                end 
                p.push(1) 
                v.push(1) 
                c +=1 
               imprimir(v) 
        end 
        invertir(p,v) 
    end     
end                     
 
def invertir(n,m) 
    for i in 0..n.size  
        n[i] = m[i] 
    end 
end 
 
def imprimir(v) 
    for i in v 
        print i, " " 
    end 
    puts" " 
end                 
 
# n  representa la altura del triangulo en este caso el nivel que se desea es  6
print pascal(5) 


#Sandy I. Valdivia