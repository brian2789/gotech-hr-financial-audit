# Human Resources Productivity & Financial Profitability Audit (GoTech)

## Project Overview
This project presents an end-to-end SQL framework designed for an online retail business (GoTech) with 10 employees. The objective is to evaluate operational efficiency by cross-referencing multi-table datasets: transactional sales records from the last 3 months (March, April, May 2026), dynamic product cost structures, and employee time-clock punch data.

The system functions as an internal control tool to audit true business profitability while pinpointing labor vulnerabilities (such as chronic tardiness) that impact floor performance and customer satisfaction.

## Relational Architecture (Data Model)
The database structure (`GoTech_Operational_Audit`) consists of 4 highly normalized core tables:
* **Empleados (Employees Ledger):** Identity tracking and hierarchy categorization.
* **Productos (Products Catalog):** Cost accounting and retail price mapping.
* **Ventas (Sales Ledger):** Transactional matrix linking sales reps, products, and operational dates.
* **Reloj_Control (Time Clock Control):** Punch-clock matrix computing theoretical shifts against real-time employee check-ins and check-outs.

## Core Audit Discoveries & Analytical Queries

### 1. Sales Performance & Staff Ranking
Aggregates sales volumes and calculates total revenue generated per representative. This allows management to isolate top-tier salespeople based on financial conversion rather than raw units sold.

### 2. Macro Financial Profitability & Margin Analysis
Calculates total gross revenue, Cost of Goods Sold (COGS), Net Income in currency, and overall Net Profit Margin percentage. This metric provides executive management with a transparent view of corporate liquidity and margins.

### 3. Time-Clock Variance & Internal Control
Leverages database time-differentiation functions (`DATEDIFF`) to calculate exact minutes of tardiness per employee. It implements conditional logic (`CASE` statements) to dynamically trigger alerts ("ALERTA: Llegada Tarde Grave") when delays exceed operational tolerance thresholds.

## Tech Stack
* **RDBMS:** Microsoft SQL Server
* **Language:** T-SQL (Transact-SQL)