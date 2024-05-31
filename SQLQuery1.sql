SELECT * FROM bank_loan_data


SELECT COUNT(id) AS Total_Loan_Application FROM bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021 

SELECT SUM(loan_amount) AS MTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

SELECT SUM(loan_amount) AS PMTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT AVG(int_rate) AS Avg_Interest_Rate From bank_loan_data

SELECT AVG(int_rate)*100 AS Avg_Interest_Rate From bank_loan_data

SELECT ROUND(Avg(dti),4)*100 AS PMTD_AVERAGE_DTI From bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' or loan_status = 'Current' Then id END)*100)
	/
	COUNT(id) as Good_loan_percentage
	FROM bank_loan_data


SELECT COUNT(id) AS Good_Loan_Application FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'




SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' Then id END)*100.0)
	/
	COUNT(id) as Bad_loan_percentage
	FROM bank_loan_data	

SELECT COUNT(id) AS Bad_Loan_Application FROM bank_loan_data
WHERE loan_status = 'Charged Off' 

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off' 

SELECT SUM(total_payment) AS bad_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off' 




SELECT 
	loan_status,
	COUNT(id) AS LoanCount,
	SUM(total_payment) AS Total_Amount_Received,
	Sum(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
	FROM bank_loan_data	GROUP BY loan_status


SELECT 
	loan_status,
	COUNT(id) AS Total_Loan_application,
	SUM(total_payment) AS Total_Amount_Received,
	Sum(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interest_Rate,
	AVG(dti * 100) AS DTI
	FROM bank_loan_data	GROUP BY loan_status


SELECT loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	Sum(loan_amount) AS MTD_Total_Funded_Amount,
	FROM bank_loan_data
	WHERE MONTH(issue_date) = 12
	GROUP BY loan_status


	SELECT address_state,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by address_state
	Order BY address_state DESC

	SELECT address_state,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by address_state
	Order BY sum(loan_amount) DESC
	
	SELECT address_state,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by address_state
	Order BY COUNT(id) DESC




	SELECT term,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by term
	Order BY term
	 
 SELECT emp_length,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by emp_length
	Order BY emp_length

	SELECT emp_length,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by emp_length
	Order BY COUNT(id) DESC


	SELECT purpose,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by purpose
	Order BY COUNT(id) DESC


	SELECT home_ownership,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	Group by home_ownership
	Order BY COUNT(id) DESC
	
	
	SELECT home_ownership,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	WHERE grade = 'A'
	Group by home_ownership
	Order BY COUNT(id) DESC


	SELECT home_ownership,
	COUNT(id) AS Total_Loan_application,
	Sum(loan_amount) AS Total_Funded_Amount,
	Sum(total_payment) AS Total_Received_Amount
	FROM bank_loan_data
	WHERE grade = 'A'
	Group by home_ownership ANd address_state = 'CA'
	Order BY COUNT(id) DESC