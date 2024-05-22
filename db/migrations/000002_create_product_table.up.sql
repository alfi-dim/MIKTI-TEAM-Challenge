create table
    mikti_products(
                   id varchar(20) primary key,
                   name varchar(50) not null,
                   owner_id varchar(20) not null,
                   harga bigint not null,
                   stock int not null default 0,
                   created_at timestamp default current_timestamp,
                   updated_at timestamp default current_timestamp,
                   CONSTRAINT owner_id_foreign_key_users FOREIGN KEY (owner_id) REFERENCES mikti_users(id)
);