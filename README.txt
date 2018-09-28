file names and discription

part_a.m   : It is used to call the function where erlang formula is written. and which will return the values of pb1 and pb2. calculated using erlang formula.

part_a_func.m  :  It is a function used to calculate the blocking probabilities using erlang's formula.

part_c.m       : It has a function call to calculate blocking probabilities using simulation.
		that is part b of a problem is covered here.
		it also calls a function to calculate blocking probabilities using simulation of the case m=k=50;
		
simccn.m	: It is a function to calculate blocking probabilities using simulation.

pard_d.m	: This code is for part (d) of the question. This gives the plots of blocking probabilities vs 'm' for pb1 and pb2 calculated using erlang formula and simulation as well.

pb1.jpg and pb2.jpg	: are the figures of plot obtained using part d of a question.  


Execution sequence	:
		
	run 
		part_a.m file   : this gives blocking prob using erlang's formula.
		part_c.m	: this will give blocking prob using simulation(part b) and blocking prob for case m=k=50(part c)
		part_d.m	: this will plot the graphs to compare between pb1 pb2 of erlang and simulated results.	
		
