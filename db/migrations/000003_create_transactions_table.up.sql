CREATE TABLE
    mikti_transactions (
      id VARCHAR(20) PRIMARY KEY,
      seller_id VARCHAR(20) NOT NULL,
      buyer_id VARCHAR(20) NOT NULL,
      total_amount BIGINT NOT NULL,
      status VARCHAR(20) NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        CONSTRAINT fk_seller_id FOREIGN KEY(seller_id) REFERENCES mikti_users(id),
        CONSTRAINT fk_buyer_id FOREIGN KEY(buyer_id) REFERENCES mikti_users(id)
    );

CREATE TABLE
    mikti_transaction_items (
        id serial PRIMARY KEY,
        transaction_id VARCHAR(20) NOT NULL,
        product_id VARCHAR(20) NOT NULL,
        quantity INT NOT NULL,
        price BIGINT NOT NULL,
        CONSTRAINT fk_product_id FOREIGN KEY(product_id) REFERENCES mikti_products(id),
        CONSTRAINT fk_transaction_id FOREIGN KEY(transaction_id) REFERENCES mikti_transactions(id)
    );