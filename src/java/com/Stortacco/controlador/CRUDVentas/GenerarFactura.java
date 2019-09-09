package com.Stortacco.controlador.CRUDVentas;

import com.Stortacco.modelo.Conectadb;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GenerarFactura {

    private Font fontboldtitulo = new Font(Font.FontFamily.COURIER, 11, Font.BOLD);
    private Font fontbold = new Font(Font.FontFamily.COURIER, 7, Font.BOLD);
    private Font font = new Font(Font.FontFamily.COURIER, 7, Font.NORMAL);

    public void EstructuraPDF(String ruta, String nomC, String fecha, String hora, int idVenta, String total) {
        try {
            Document doc = new Document(PageSize.A7, 5, 5, 5, 5);
            PdfWriter.getInstance(doc, new FileOutputStream(ruta));
            doc.open();
            Image img = Image.getInstance("https://i.imgur.com/JMvoURH.png");
            img.scalePercent(70);
            img.setAlignment(Element.ALIGN_CENTER);
            doc.add(img);
            doc.add(new Paragraph("\n"));
            doc.add(Header());
            doc.add(new Paragraph("\n"));
            doc.add(Informacion(String.valueOf(idVenta), nomC, fecha, hora));
            doc.add(new Paragraph("\n"));
            doc.add(Prodcutos(idVenta));
            doc.add(new Paragraph("\n"));
            doc.add(Total(total));
            doc.add(new Paragraph("\n"));
            doc.add(Footer());
            doc.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
    }

    public PdfPTable Header() {
        PdfPTable header = new PdfPTable(1);
        header.setWidthPercentage(100);
        PdfPCell cell;

        cell = new PdfPCell(new Paragraph(new Chunk("STORTACCO BAR", fontboldtitulo)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        header.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("NIT: 809.635.874-5", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        header.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("TELEFONO: 3012159325", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        header.addCell(cell);

        return header;

    }

    public PdfPTable Informacion(String numeroFactura, String nombreCajero, String fecha, String hora) {
        PdfPTable informacion = new PdfPTable(2);
        informacion.setWidthPercentage(100);
        PdfPCell cell;

        Chunk c1Fila1d1 = new Chunk("CAJERO: ", fontbold), c2Fila1d1 = new Chunk(nombreCajero.toUpperCase(), font);
        Paragraph pFila1d1 = new Paragraph();
        pFila1d1.add(c1Fila1d1);
        pFila1d1.add(c2Fila1d1);
        cell = new PdfPCell(pFila1d1);
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        informacion.addCell(cell);

        Chunk c1Fila1d2 = new Chunk("#FACTURA: ", fontbold), c2Fila1d2 = new Chunk(numeroFactura.toUpperCase(), font);
        Paragraph pFila1d2 = new Paragraph();
        pFila1d2.add(c1Fila1d2);
        pFila1d2.add(c2Fila1d2);
        cell = new PdfPCell(pFila1d2);
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_RIGHT);
        cell.setBorder(PdfPCell.NO_BORDER);
        informacion.addCell(cell);

        Chunk c1Fila2d1 = new Chunk("FECHA: ", fontbold), c2Fila2d1 = new Chunk(fecha.toUpperCase(), font);
        Paragraph pFila2d1 = new Paragraph();
        pFila2d1.add(c1Fila2d1);
        pFila2d1.add(c2Fila2d1);
        cell = new PdfPCell(pFila2d1);
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        informacion.addCell(cell);

        Chunk c1Fila2d2 = new Chunk("HORA: ", fontbold), c2Fila2d2 = new Chunk(hora.toUpperCase(), font);
        Paragraph pFila2d2 = new Paragraph();
        pFila2d2.add(c1Fila2d2);
        pFila2d2.add(c2Fila2d2);
        cell = new PdfPCell(pFila2d2);
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_RIGHT);
        cell.setBorder(PdfPCell.NO_BORDER);
        informacion.addCell(cell);

        return informacion;

    }

    public PdfPTable Prodcutos(int idVenta) {
        PdfPTable productos = new PdfPTable(4);
        productos.setWidthPercentage(100);
        PdfPCell cell;

        cell = new PdfPCell(new Paragraph(new Chunk("NOMBRE", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float) 0.4);
        cell.setBorderWidthBottom((float) 0.4);
        cell.setPadding(3);
        productos.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("CATEGORÍA", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float) 0.4);
        cell.setBorderWidthBottom((float) 0.4);
        cell.setPadding(3);
        productos.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("CANTIDAD", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float) 0.4);
        cell.setBorderWidthBottom((float) 0.4);
        cell.setPadding(3);
        productos.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("VALOR", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float) 0.4);
        cell.setBorderWidthBottom((float) 0.4);
        cell.setPadding(3);
        productos.addCell(cell);

        try {
            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            PreparedStatement ps3;
            ResultSet rs3;

            ps = c.prepareStatement("select * from detalles_ventas where idVenta=?;");
            ps.setInt(1, idVenta);
            rs = ps.executeQuery();

            while (rs.next()) {
                ps2 = c.prepareStatement("select * from detalles_productos where idDetallesProductos=?;");
                ps2.setInt(1, rs.getInt("idProducto"));
                rs2 = ps2.executeQuery();

                if (rs2.next()) {
                    ps3 = c.prepareStatement("select * from productos where idProductos=?;");
                    ps3.setInt(1, rs2.getInt("idProducto"));
                    rs3 = ps3.executeQuery();

                    if (rs3.next()) {

                        cell = new PdfPCell(new Paragraph(new Chunk(rs3.getString("Nombre").toUpperCase(), font)));
                        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
                        cell.setBorder(PdfPCell.NO_BORDER);
                        productos.addCell(cell);

                        cell = new PdfPCell(new Paragraph(new Chunk(rs2.getString("Categoria").toUpperCase(), font)));
                        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
                        cell.setBorder(PdfPCell.NO_BORDER);
                        productos.addCell(cell);

                        cell = new PdfPCell(new Paragraph(new Chunk(String.valueOf(rs.getInt("Cantidad")), font)));
                        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
                        cell.setBorder(PdfPCell.NO_BORDER);
                        productos.addCell(cell);

                        cell = new PdfPCell(new Paragraph(new Chunk(String.valueOf(rs2.getInt("Precio_Venta")), font)));
                        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
                        cell.setBorder(PdfPCell.NO_BORDER);
                        productos.addCell(cell);

                    }
                    ps3.close();
                    rs3.close();
                }
                ps2.close();
                rs2.close();
            }
            ps.close();
            rs.close();
        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
        }

        return productos;

    }

    public PdfPTable Total(String totalNum) {
        PdfPTable total = new PdfPTable(1);
        total.setWidthPercentage(100);
        PdfPCell cell;

        Chunk c1Fila1d1 = new Chunk("TOTAL: ", fontbold), c2Fila1d1 = new Chunk(totalNum, font);
        Paragraph pFila1d1 = new Paragraph();
        pFila1d1.add(c1Fila1d1);
        pFila1d1.add(c2Fila1d1);
        cell = new PdfPCell(pFila1d1);
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        total.addCell(cell);

        return total;
    }

    public PdfPTable Footer() {
        PdfPTable footer = new PdfPTable(1);
        footer.setWidthPercentage(100);
        PdfPCell cell;

        cell = new PdfPCell(new Paragraph(new Chunk("GRACIAS POR SU COMPRA", fontbold)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float) 0.4);
        cell.setBorderWidthBottom((float) 0.4);
        cell.setPadding(3);
        footer.addCell(cell);

        cell = new PdfPCell(new Paragraph(new Chunk("STORTACCO@GMAIL.COM", font)));
        cell.setHorizontalAlignment((int) PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        footer.addCell(cell);

        return footer;
    }
}
