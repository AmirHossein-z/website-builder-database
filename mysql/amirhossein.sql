
// add data to database



// مشکل:‌وقتی یک مشتری یک تیکت ایجاد میکنه تا وقتی پشتیبانی پاسخ نداده چطور ممکنه تیکت ایدی مربوط به یک پشتیبان رو ذخیره کنه؟ و من تاریخ ابدیت و بسته شدن تیکت رو null گذاشتم چون در ابتدا می تواند null باشد

insert into ticket
(ID,subject,description,state,date_created,date_updated,date_closed,customerID,employeeID)
values
(1,"unable to login","I can't login to my dashboard",0,"1400/10/16",
null,null,5849,922140);

insert into ticket
(ID,subject,description,state,date_created,date_updated,date_closed,customerID,employeeID)
values
(2,"unable to buy new subscription","I can't buy new subscription please help",0,"1400/10/17","1400/10/18","1400/10/25",9991,92144);

insert into ticket
(ID,subject,description,state,date_created,date_updated,date_closed,customerID,employeeID)
values
(3,"how can I buy domain?","I want to buy a domain for my template how I can do this?",0,"1400/12/18","1400/12/18,1400/10/25",123,824);


// جدول reply یک موجودیت ضعیف نیست؟‌چون تا وقتی جدول ticket ایجاد نشه نمیتونه این وجود داشته باشه اگه اینجوری باشه ticketID, employeeID با ID یک کلید اصلی میشن چون مستقلا نمیتونه ID داشته باشه!
insert into reply
(ID,answer,date_answered,ticketID,employeeID)
values
(1,"you can buy subscription from your panel vial this link","1400/10/18",2,92144);

insert into reply
(ID,answer,date_answered,ticketID,employeeID)
values
(1,"we showed you how to buy a domain with this video","1400/12/18",3,
824);


// وقتی میخوایم جدول مشتری رو ایجاد کنیم چرا باید subscriptionID , buyID رو هم وارد کنیم؟!



insert into faq
(ID,question,content)
values
(1,"How can I use multiple template at the same time","when you bought a subscription, you can use all templates base on subscription you bought");

insert into faq
(ID,question,content)
values
(2,"How can I renew my subscription","you can renew it via panel -> subscription -> renew it");


insert into subscription
(ID,price,date_expired,discount_amount)
values
(50,100000,"1400/11/20", 0);

insert into subscription
(ID,price,date_expired,discount_amount)
values
(6,50000,"1400/11/30",10);


insert into buy
(ID,date_purchased,walletID,subscriptionID)
values
(10,"1400/10/20",20,50);

insert into buy
(ID,date_purchased,walletID,subscriptionID)
values
(2,"1400/10/30",15,6);


// query...


تمام تیکت ها به همراه پاسخ آن ها که توسط مشتری با شناسه 123 ایجاد شده را پیدا کنید.
شناسه تمام مشتریانی که تابه حال توسط پشتیبانی با شناسه ۹۱۰۰ پاسخ داده شده را لیست کنید
شناسه تمام تراکنش هایی که مربوط به ولت ایدی ۹۹۹ هست را به همراه شناسه اشتراک های خریداری شده مربوط به آن لیست کنید
نام ونام خانوادگی و کد ملی مشتری و وضعیت تراکنش های  تمام مشتریانی که موجودی ان ها صفر است را لیست کنید
نام , نام خانوادگی تمام طراحان قالب هایی که توسط مشتری با شناسه ۱۲  به داشبوردش اضافه شده را لیست کنید


1:
select *
from customer natural join ticket natural join reply
where customer.ID = ticket.customerID and customer.ID = 123 and reply.ticketID = ticket.ID

2:
select customerID
from ticket
where employeeID = 9100

3:
select transaction.ID, buy.subscriptionID
from transaction natural join buy
where transaction.walletID = buy.walletID and transaction.walletID = 999

4:
select customer.first_name,customer.last_name,customer.national_number,transaction.status
from customer natural join transaction natural join wallet
where wallet.ID = transaction.walletID and customer.ID = transaction.customerID and wallet.inventory = 0

5:
select employee.first_name,employee.last_name
from employee natural join employee_template natural join customer_template
where employee.ID = employee_template.employeeID and employee_template.templateID = customer_template.templateID and customer_template.customerID = 12
