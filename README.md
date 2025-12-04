# customer_behaviour_analysis
End-to-end customer behaviour analysis project using Python, SQL Server, and Power BI. Includes data cleaning, feature engineering, SQL business insights (20 queries), interactive dashboard, and strategic recommendations.
Customer Behaviour Analysis – End-to-End Data Project
This project provides a comprehensive analysis of customer shopping behaviour using a dataset of ~3,900 retail transactions.
The goal is to understand how customers shop, what drives spending, which products perform best, and how subscription or discount behaviours influence purchasing.

The project follows a complete Data Analytics Workflow:
Python → SQL → Power BI → Business Insights
1. Project Overview
   This end-to-end project explores customer purchasing patterns across demographics, product categories, seasons, and engagement levels.
2. Dataset Summary
   The dataset captures demographic, transactional, and behavioral information across:
   Customer Demographics - Age, Gender, Location, Customer ID
   Product & Transaction Information - Item Purchased, Category, Purchase Amount, Season, Size, Colour, Discount Applied, Review Rating, Shipping Type, Promo Code Used
   Behavioural Indicators - Previous Purchases, Frequency of Purchases, Subscription Status, Payment Method
   After preprocessing, the dataset contained:
   3,900 rows
   18 refined and standardized columns
   Engineered features:
   age_group
   purchase_frequency_days
3. Exploratory Data Analysis (Python)
   Python was used to perform data cleaning, preparation, and feature engineering.
   - Missing Value Treatment
     Review ratings were imputed using category-wise medians, ensuring realistic replacement.
   - Column Standardization
     Column names were converted to snake_case for SQL compatibility.
     Purchase amount column renamed for clarity.
   - Feature Engineering
     Age groups created using quantile-based binning (Young Adult, Adult, Middle-Aged, Senior).
     purchase_frequency_days created by mapping textual purchase frequencies to numeric values.
   - Removal of Redundant Data
     promo_code_used was dropped after identifying it duplicated discount information.
   -Database Loading
    The cleaned dataset was uploaded into SQL Server using SQLAlchemy + pyodbc, enabling advanced business querying.
4. SQL-Based Business Insights
   Twenty SQL queries were executed to extract actionable business insights across demographics, product behavior, satisfaction, and engagement.
   -Key Findings
   1. Revenue & Frequency by Age Group
      Young Adults and Middle-Aged customers contributed the highest revenue and strong purchase frequency.
   2. Discount Sensitivity
      Females and younger age groups were the most likely to use discounts.
   3. Review Satisfaction Across Payment Methods
      Certain payment types correlated with slightly higher customer satisfaction.
   4. Repeat Customer Behaviour
      Clothing and Footwear categories had the highest repeat-buying activity.
   5. Subscription Behaviour
      Subscribers purchased more frequently and gave slightly higher review ratings.
   6. Rating vs Spending Relationship
      Higher review ratings aligned with higher purchase amounts.
   7. Customer Segments (New, Returning, Loyal)
      Loyal customers—though fewer—generated the highest total revenue.
   8. Top 3 Products per Category
      Window functions identified best-sellers across each category (e.g., Jewelry, Blouse, Sandals).
   9. Repeat Buyers & Subscription
       Customers with >5 previous purchases were more likely to be subscribers.
5. Power BI Dashboard
   The final dashboard consists of two insight-driven pages:
   one focusing on customer behaviour and segmentation, and the second focusing on product and category performance.
   Page 1 — Customer Overview & Behaviour
  - Key Insights
    Middle-Aged and Young Adult customers lead revenue contribution.
    Loyal customers generate the majority of repeat revenue.
    Females slightly outperform males in spend.
    Purchase trends vary noticeably with previous purchase count.
    Subscriber segments exhibit more consistent purchasing behaviour.
  Page 2 — Product, Revenue & Review Insights
  - Key Insights
    Top revenue-generating products include Blouse, Shirt, Dress, Jewelry.
    Fall and Spring are peak sales seasons.
    Footwear and Accessories have the highest average ratings.
    Express shipping users spend slightly more, but Standard shipping is rated higher.
    Discount-heavy items still contribute strongly to revenue.
6. Business Recommendations
   1. Strengthen Subscription Campaigns -Subscribers purchase more frequently—target high-engagement customers for subscription conversion.
   2. Enhance Loyalty Benefits - Offer incentives (points, exclusive deals, early access) to retain loyal customers.
   3. Optimize Seasonal Campaigns - Since Fall and Spring bring the highest revenue, align promotions with these periods.
   4. Push High-Performing Categories - Increase promotion of Blouse, Jewelry, Footwear, and seasonal best-sellers.
   5. Improve Express Shipping Experience - Better delivery accuracy and packaging quality may improve ratings.
   6. Review Discount Strategy - Balance discount frequency to maintain margins while retaining engagement.
   7. Demographic-Focused Targeting - Young Adults and Middle-Aged groups should be prioritized for marketing.
     
  
