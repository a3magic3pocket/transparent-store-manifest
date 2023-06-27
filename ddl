-- database 생성
CREATE DATABASE transparent_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 카테고리
CREATE TABLE IF NOT EXISTS category (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    is_valid TINYINT(1) NOT NULL DEFAULT 1,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 상품
CREATE TABLE IF NOT EXISTS product (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,
    registrant_id BIGINT UNSIGNED NOT NULL,
    price text NOT NULL,
    is_shown TINYINT(1) NOT NULL DEFAULT 0,
    is_valid TINYINT(1) NOT NULL DEFAULT 1,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 상품이미지
CREATE TABLE IF NOT EXISTS product_image (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    product_id BIGINT UNSIGNED NOT NULL,
    url text NOT NULL,
    is_rep TINYINT(1) NOT NULL DEFAULT 0,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 장바구니
CREATE TABLE IF NOT EXISTS cart (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    buyer_id BIGINT UNSIGNED NOT NULL,
    product_id BIGINT UNSIGNED NOT NULL,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 사용자
CREATE TABLE IF NOT EXISTS user (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    is_valid TINYINT(1) NOT NULL DEFAULT 0,
    user_group_id BIGINT UNSIGNED NOT NULl,
    phone_number VARCHAR(20) NOT NULL,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 사용자 그룹
CREATE TABLE IF NOT EXISTS user_group (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 사용자 주소 관계
CREATE TABLE IF NOT EXISTS user_address_map (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULl,
    address_id BIGINT UNSIGNED NOT NULl,
    is_rep BIGINT UNSIGNED NOT NULl,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 주소
CREATE TABLE IF NOT EXISTS address (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    lot_number_address varchar(1000) NOT NULl,
    road_name_address varchar(1000) NOT NULl,
    is_valid BIGINT UNSIGNED NOT NULl,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 주문
CREATE TABLE IF NOT EXISTS order (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    buyer_id BIGINT UNSIGNED NOT NULl,
    product_id BIGINT UNSIGNED NOT NULl,
    lot_number_address varchar(1000) NOT NULl,
    road_name_address varchar(1000) NOT NULl,
    order_status_id BIGINT UNSIGNED NOT NULl,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 주문상태
CREATE TABLE IF NOT EXISTS order_status (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    exposed_name VARCHAR(255) NOT NULL,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 운송장 번호
CREATE TABLE IF NOT EXISTS waybill (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(255) NOT NULL, 
    order_id BIGINT UNSIGNED NOT NULl,
    order_status_id  BIGINT UNSIGNED NOT NULl,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;


-- 카드
CREATE TABLE IF NOT EXISTS card (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    owner_id BIGINT UNSIGNED NOT NULl,
    masked_number VARCHAR(255) NOT NULL, 
    pg_key VARCHAR(255) NOT NULL, 
    company VARCHAR(100) NOT NULL, 
    valid_ym VARCHAR(10) NOT NULL,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

-- 결제 기록
CREATE TABLE IF NOT EXISTS payment_history (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    payer_id BIGINT UNSIGNED NOT NULl,
    card_id BIGINT UNSIGNED NOT NULl,
    payment_status_id BIGINT UNSIGNED NOT NULl,
    created_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'
;

# 결제 기록
- payment_history
  - id
  - payer_id
  - card_id
  - payment_status
