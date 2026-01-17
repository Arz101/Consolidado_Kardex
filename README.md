# Consolidado Kardex - Peru

## 📋 Project Overview

This project contains a comprehensive SQL Server database solution for managing and consolidating inventory data (Kardex) for retail operations in Peru. The system automates data collection, processing, and reporting of inventory movements, sales, purchases, and transfers across multiple store locations.

**Database Name:** `CONSOLIDADO_KARDEX`  
**Author:** Adrian Rodriguez  
**Created:** January 13, 2026

---

## 🎯 Purpose

The Kardex consolidation system provides:
- Centralized inventory management across multiple stores
- Real-time tracking of inventory movements (purchases, sales, transfers, entries/exits)
- Price management across store locations
- Automated data aggregation and consolidation
- Scheduled execution via SQL Server Agent jobs
- Performance-optimized queries and stored procedures

---

## 📁 Project Structure

### **JOB.sql**
SQL Server Agent job configuration that executes the main consolidation procedure `SP_CONSOLIDADO_KARDEX` every 4 hours between 6:00 AM and 10:00 PM.

### **Funciones/** (Functions Folder)
Contains custom SQL Server functions for data retrieval and calculations:
- `Funcion Obtener Datos por Tienda Inventario Actual y Anterior.sql` - Retrieves current and previous inventory data by store
- `Funcion Precio Tiendas Compras Excel.sql` - Price information for purchases in Excel format
- `Funcion Precio Tiendas Excel.sql` - Store prices in Excel format

### **Querys Kardex/** (Core Queries Folder)
Contains the main query files and database schema:
- **Compras.sql** - Purchase transactions
- **ComprasDetalle.sql** - Detailed purchase line items
- **Database Schema.sql** - Database creation and configuration scripts
- **EntradasSinClasificar.sql** - Unclassified incoming entries
- **Index.sql** - Database indexes for performance optimization
- **InventarioMes.sql / InventarioMEs UNION ALL.sql** - Monthly inventory data
- **PrecioTiendas.sql** - Store pricing data
- **PrecioTiendasPromedio Original Query.sql** - Average store prices queries
- **SalidasSinClasificar.sql** - Unclassified outgoing entries
- **SP_Load_Tables.sql** - Stored procedure for loading tables
- **TRASLADOENTRADAS.sql** - Transfer entries (incoming)
- **TrasladosSaliedas.sql** - Transfer exits (outgoing)
- **VentasPorProducto.sql** - Sales by product data

### **SP/** (Stored Procedures Folder)
Contains all stored procedures for data processing:
- **SP_CONSOLIDADO_KARDEX.sql** - Main orchestrator procedure that executes all consolidation steps
- **SP_All.sql** - Master file containing all procedures
- **SP_Consolidado_Kardex_Compras_Detalles_FR.sql** - Process purchase details
- **SP_Consolidado_Kardex_Compras_FR.sql** - Process purchases
- **SP_Consolidado_Kardex_EntradasSinClasificar_FR.sql** - Process unclassified entries
- **SP_Consolidado_Kardex_InventarioMes_FR.sql** - Process monthly inventory
- **SP_Consolidado_Kardex_PrecioTiendas_FR.sql** - Process store prices
- **SP_Consolidado_Kardex_PrecioTiendasCompras_FR.sql** - Process purchase prices
- **SP_Consolidado_Kardex_Traslados_Entradas_FR.sql** - Process transfer entries
- **SP_Consolidado_Kardex_Traslados_Salidas_FR.sql** - Process transfer exits
- **SP_Consolidado_Kardex_VentasPorProducto_FR.sql** - Process sales by product

### **Tables/** (Table Definitions Folder)
Contains table creation and structure definitions:
- **Compras_Table.sql** - Purchase master table
- **Compras_Detalle_Table.sql** - Purchase detail table
- **EntradasSinClasificar_Table.sql** - Unclassified entries table
- **InvetarioMes_Table.sql** - Monthly inventory table
- **PrecioTiendas_Table.sql** - Store prices table
- **PreciosTiendasCompras_Table.sql** - Store purchase prices table
- **PreciosTiendasCompras__Promedio_Table (AuxTable).sql** - Auxiliary average prices table
- **SalidaSinClasificar_Table.sql** - Unclassified exits table
- **TrasladoEntrantes_Table.sql** - Incoming transfers table
- **TrasladoSalientes_Table.sql** - Outgoing transfers table
- **VentasPorProducto_Table.sql** - Sales by product table

---

## 🔧 Key Components

### Main Stored Procedure: SP_CONSOLIDADO_KARDEX
This is the orchestrator procedure that:
1. Checks for existing executions to prevent concurrent runs
2. Sequentially executes 10 sub-procedures in order:
   - Purchase details processing
   - Unclassified entries processing
   - Purchase processing
   - Sales by product processing
   - Monthly inventory processing
   - Purchase prices processing
   - Store prices processing
   - Store prices consolidation
   - Transfer entries processing
   - Transfer exits processing
3. Includes error handling with try-catch blocks
4. Provides detailed logging via RAISERROR messages

### Database Configuration
- **ANSI Settings:** Multiple ANSI options configured
- **Auto Close:** Enabled
- **Auto Shrink:** Disabled
- **Auto Update Statistics:** Enabled
- **File Growth:** 65536KB increments
- **Maximum Log Size:** 2048GB

### Scheduled Execution
- **Frequency:** Every 4 hours
- **Active Hours:** 6:00 AM to 10:00 PM daily
- **Retry Policy:** 1 attempt with 5-minute intervals on failure

---

## 📊 Data Flow

```
Source Data (from ERP/POS systems)
         ↓
    Database Tables
         ↓
   Consolidation Procedures (SP_CONSOLIDADO_KARDEX)
         ↓
  Processing Sub-Procedures (10 parallel processes)
         ↓
   Consolidated Data Tables
         ↓
   Reports & Analytics
```

---

## 🚀 Execution Steps

To set up and run the Kardex consolidation system:

1. **Create Database Schema**
   ```sql
   -- Run Database Schema.sql
   ```

2. **Create Tables**
   ```sql
   -- Run all files in Tables/ folder in order
   ```

3. **Create Functions**
   ```sql
   -- Run all files in Funciones/ folder
   ```

4. **Create Stored Procedures**
   ```sql
   -- Run SP_All.sql or individual SP files
   ```

5. **Load Data** (Initial Setup)
   ```sql
   -- Run SP_Load_Tables.sql
   ```

6. **Create SQL Agent Job**
   ```sql
   -- Run JOB.sql
   ```

---

## 📈 Key Tables & Entities

| Table | Purpose |
|-------|---------|
| Compras | Master purchase records |
| Compras_Detalle | Detailed line items for purchases |
| InventarioMes | Monthly inventory snapshots |
| PrecioTiendas | Current store prices |
| PreciosTiendasCompras | Store-specific purchase prices |
| VentasPorProducto | Sales aggregated by product |
| TrasladoEntrantes | Incoming inventory transfers |
| TrasladoSalientes | Outgoing inventory transfers |
| EntradasSinClasificar | Unclassified incoming entries |
| SalidaSinClasificar | Unclassified outgoing entries |

---

## 🔍 Performance Features

- **Indexed Queries:** Database includes optimized indexes for fast data retrieval
- **Aggregation Functions:** Custom functions for efficient data calculations
- **Concurrent Execution Prevention:** Built-in checks to prevent duplicate procedure executions
- **Scheduled Processing:** Automated execution reduces manual intervention

---

## 🛠️ Maintenance

### Regular Tasks
- Monitor SP_CONSOLIDADO_KARDEX execution times
- Review index fragmentation monthly
- Update statistics on high-transaction tables
- Archive old Kardex data quarterly

### Troubleshooting
- Check SQL Server Agent job history for failures
- Review RAISERROR messages in SQL Server logs
- Validate data integrity in source tables
- Monitor disk space usage

---

## 📝 Notes

- All procedures include `SET NOCOUNT ON` to reduce network traffic
- Execution is tracked via RAISERROR messages (severity 0, state 1)
- The system is designed for Peru retail operations
- CSV and Excel export formats are supported via functions

---

## 📞 Support

For issues or modifications, contact the development team.

**Last Updated:** January 16, 2026
