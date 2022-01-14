
-- add data to database



-- مشکل:‌وقتی یک مشتری یک تیکت ایجاد میکنه تا وقتی پشتیبانی پاسخ نداده چطور ممکنه تیکت ایدی مربوط به یک پشتیبان رو ذخیره کنه؟ و من تاریخ ابدیت و بسته شدن تیکت رو null گذاشتم چون در ابتدا می تواند null باشد


-- جدول reply یک موجودیت ضعیف نیست؟‌چون تا وقتی جدول ticket ایجاد نشه نمیتونه این وجود داشته باشه اگه اینجوری باشه ticketID, employeeID با ID یک کلید اصلی میشن چون مستقلا نمیتونه ID داشته باشه!


-- وقتی میخوایم جدول مشتری رو ایجاد کنیم چرا باید subscriptionID , buyID رو هم وارد کنیم؟!




-- query...


تمام تیکت ها به همراه پاسخ آن ها که توسط مشتری با شناسه 1091 ایجاد شده را پیدا کنید.
شناسه تمام مشتریانی که تابه حال توسط پشتیبانی با شناسه 3 پاسخ داده شده را لیست کنید
شناسه تمام تراکنش هایی که مربوط به ولت ایدی 2 هست را به همراه شناسه اشتراک های خریداری شده مربوط به آن لیست کنید
نام ونام خانوادگی و کد ملی مشتری و وضعیت تراکنش های  تمام مشتریانی که موجودی ان ها 900000 است را لیست کنید
نام , نام خانوادگی تمام طراحان قالب هایی که توسط مشتری با شناسه 1091  به داشبوردش اضافه شده را لیست کنید


1:
select * from ticket,reply where reply.ticketID = ticket.ID and reply.ticketID = (select Id from ticket where ticket.customerID = 1091);


2:
select customerID
from ticket
where employeeID = 3

3:
select transaction.ID, buy.subscriptionID
from transaction natural join buy
where transaction.walletID = buy.walletID and transaction.walletID = 2;

4:

select customer.first_name,customer.last_name,customer.national_number,transaction.status
from customer, transaction, wallet
where wallet.ID = transaction.walletID and customer.ID = transaction.customerID and wallet.inventory = 900000;


5:
select employee.first_name,employee.last_name
from employee, employee_template, customer_template
where employee.ID = employee_template.employeeID and employee_template.templateID = customer_template.templateID and customer_template.customerID = 1091;
