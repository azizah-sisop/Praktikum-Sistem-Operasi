#!/bin/bash
echo “ masukkan nilai : “
read nilai

                for ((i=1; i<=nilai; i=i+1))
do

                let tiga=$i%3
                let lima=$i%5
                let libes=$i%15    
                if   [ $libes   -eq   0 ]
                                    then
                                    echo  “FizzBuzz”;
                if   [ $tiga   -eq   0 ]
                                    then
                                    echo  “Fizz”;
                if   [ $lima   -q   0 ]
                                    then
                                    echo  “Buzz”;
                else
                                    echo  “$i”;
                fi
done
