create database upl;
show databases;
use upl;


select * from UPI_Transactionss;

1)Find banks that have sent more than 1000 successful transactions, and list the count of their successful transactions.


SELECT BankNameSent, COUNT(*) AS SuccessfulTransactions FROM UPI_Transactionss 
WHERE Status = 'Success' 
GROUP BY BankNameSent 
HAVING COUNT(*) > 1000 
ORDER BY SuccessfulTransactions DESC;



2)Calculate the daily average transaction amount.


SELECT TransactionDate, AVG(Amount) FROM upi_transactionss 
GROUP BY TransactionDate
ORDER BY TransactionDate 
LIMIT 5;

3) List the Transaction IDs and Amounts for transactions where the amount is greater than the overall average transaction amount.


SELECT TransactionID, Amount FROM UPI_Transactionss
WHERE Amount > (SELECT AVG(Amount) FROM UPI_Transactions) 
LIMIT 5;

4) Count the number of transactions for each combination of 'Purpose' and 'Gender'.


SELECT Purpose, Gender, COUNT(*) FROM UPI_Transactionss 
GROUP BY Purpose, Gender 
ORDER BY Purpose, Gender 
LIMIT 5;

5) Find the top 3 cities by total transaction amount, specifically for transactions of type 'Payment'.


SELECT City, SUM(Amount) AS TotalPaymentAmount FROM UPI_Transactionss
WHERE TransactionType = 'Payment' 
GROUP BY City 
ORDER BY TotalPaymentAmount desc
LIMIT 3;

6) Identify customer accounts that have used more than one distinct payment method.


SELECT CustomerAccountNumber FROM upi_transactionss 
GROUP BY CustomerAccountNumber 
HAVING COUNT(DISTINCT PaymentMethod) > 1 
LIMIT 5;


7) Find the total amount transacted by each gender.


SELECT Gender, SUM(Amount) AS TotalAmount FROM UPI_Transactionss
GROUP BY Gender;


8)List the Transaction IDs for transactions that failed and were made on a 'Mobile' device.


SELECT TransactionID FROM upi_transactionss 
WHERE Status = 'Failed' AND DeviceType = 'Mobile' 
LIMIT 5;


9)Count the number of transactions for each currency, ordered by the count in descending order.


SELECT Currency, COUNT(*) FROM UPI_Transactionss 
GROUP BY Currency 
ORDER BY COUNT(*) DESC;

10)Calculate the average 'CustomerAge' for each 'City'.


SELECT City, AVG(CustomerAge) FROM UPI_Transactionss 
GROUP BY City 
ORDER BY City;

11)List the Transaction IDs, Purpose, and Amount for transactions where the 'Purpose' is either 'Food' or 'Shopping'.


SELECT TransactionID, Purpose, Amount FROM UPI_Transactionss 
WHERE Purpose IN ('Food', 'Shopping')
LIMIT 5;

12) List the Transaction IDs, Payment Mode, Status, and Amount for transactions that are 'Instant' payments and have a 'Success' status.


SELECT TransactionID, PaymentMode, Status, Amount FROM UPI_Transactionss 
WHERE PaymentMode = 'Instant' AND Status = 'Success' 
LIMIT 5;

13)Find customer accounts that have a total transaction amount exceeding 1,000,000.


SELECT CustomerAccountNumber, SUM(Amount) AS TotalSpent FROM UPI_Transactionss 
GROUP BY CustomerAccountNumber 
HAVING SUM(Amount) > 1000000 
ORDER BY TotalSpent 
DESC LIMIT 5;

14)Identify merchants that have processed transactions in more than one distinct city.


SELECT MerchantName FROM UPI_Transactionss 
GROUP BY MerchantName 
HAVING COUNT(DISTINCT City) > 1 
LIMIT 5;

15) Calculate the average transaction amount for 'Transfer' and 'Payment' transaction types.


SELECT TransactionType, AVG(Amount) FROM UPI_Transactionss 
GROUP BY TransactionType;