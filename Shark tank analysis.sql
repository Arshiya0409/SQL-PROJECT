create database project1;
use project1;
select * from pitches;      
select * from episodes;
select * from pitches limit 6;
-- Show the pitched brands from the clothing industry
select Brand,Industry from pitches where Industry='Clothing';
-- show the pitch number for these brands:
select Brand,Industry,Pitchnumber from pitches where Industry='Clothing';
-- Show the pitches that have been successful in attracting investments 
select Pitchnumber,Investment_Amount from episodes where Investment_Amount >0;
/* Now, for the successful pitches,  show the brands and the industry information
 Since this query would require data from two different tables (episodes and pitches), 
 we'll have to join the two tables. */
select e.pitchnumber,Investment_Amount,Brand,Industry  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber;
select e.pitchnumber,Investment_Amount,Brand,Industry  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>40;
/*How do we know the industries preferred by the sharks?
In other words, can we extract the number successful pitches in each industry? For such questions, we'll need to summarize the data. In SQL, we summarize the data
using Group By clause.*/
select Industry,count(e.pitchnumber)pitch_count  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Industry;
-- Let's sort the above data by the total number of investments in descending order
select Industry,count(e.pitchnumber)totalsuccesspitches  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Industry order by count(e.pitchnumber) desc ;
-- Just show the top 3 industries that have attracted the investments
select Industry,count(e.pitchnumber)totalsuccesspitches  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Industry order by count(e.pitchnumber) desc limit 3;
select Industry,count(e.pitchnumber)totalsuccesspitches  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Industry order by 2 desc;
-- Show those industries that have attracted at least 8 investments
select Industry,count(e.pitchnumber)totalpitches  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Industry having count(e.pitchnumber) >=8;
select * from episodes inner join pitches using (pitchnumber);
-- Show the ideas from the Food & Beverages industry
select e.pitchnumber,Idea,Industry  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Industry='Food & Beverages';
-- Show the ideas that were able to attract investment amount
select Idea from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Idea;
select Idea,count(e.pitchnumber)totalsuccesspitches from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Investment_Amount>0 group by Idea order by count(e.pitchnumber) desc limit 3;
-- Show the total number of ideas where Ashneer invested
select e.pitchnumber,Idea,Industry  from episodes as e inner join pitches as p on e.Pitchnumber=p.Pitchnumber where Ashneer='y';

