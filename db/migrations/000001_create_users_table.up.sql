create table
    mikti_users(
        id varchar(20) primary key,
        name varchar(50) not null,
        username varchar(50) not null,
        password varchar(255) not null,
        address_id varchar(20),
        role int not null,
        phonenumber varchar(50) not null,
        created_at timestamp default current_timestamp,
        updated_at timestamp default current_timestamp,
        CONSTRAINT unique_address UNIQUE (address_id)
    );