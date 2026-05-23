package in.sp.main.ServicesImpl;
import java.io.File;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import in.sp.main.Entities.FresherProfile;
import in.sp.main.Entities.InternshipCertificate;
import in.sp.main.Entities.User;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Repositories.InternshipCertificateRepository;
import in.sp.main.Services.CertificateService;

@Service
public class CertificateServiceImpl implements CertificateService
{

	@Autowired
	public FresherProfileRepository fresherProfileRepository;
	@Autowired
	public InternshipCertificateRepository internshipCertificateRepository;
	@Override
	public String generateCertificate(User user) {

	    try {

	        FresherProfile fresher =
	                fresherProfileRepository.findByUser(user).get();

	        // =========================
	        // SAVE PATH
	        // =========================

	        String uploadDir =
	                System.getProperty("user.dir")
	                + File.separator
	                + "certificates";

	        File folder = new File(uploadDir);

	        if (!folder.exists()) {
	            folder.mkdirs();
	        }

	        // =========================
	        // FILE NAME
	        // =========================

	        String fileName =
	                "certificate_" + user.getId() + ".pdf";

	        String fullPath =
	                uploadDir
	                + File.separator
	                + fileName;

	        // =========================
	        // DOCUMENT
	        // =========================

	        Rectangle pageSize =
	                new Rectangle(950, 500);

	        Document document =
	                new Document(
	                        pageSize,
	                        20,
	                        20,
	                        20,
	                        20
	                );

	        PdfWriter.getInstance(
	                document,
	                new FileOutputStream(fullPath)
	        );

	        document.open();

	        // =========================
	        // MAIN TABLE
	        // =========================

	        PdfPTable mainTable =
	                new PdfPTable(1);

	        mainTable.setWidthPercentage(100);

	        PdfPCell cell =
	                new PdfPCell();

	        cell.setBackgroundColor(
	                new BaseColor(5, 5, 5)
	        );

	        cell.setBorderColor(
	                new BaseColor(212, 175, 55)
	        );

	        cell.setBorderWidth(4);

	        cell.setPadding(14);

	        // =========================
	        // LOGO
	        // =========================

	        try {

	            String logoPath =
	                    System.getProperty("user.dir")
	                    + File.separator
	                    + "src"
	                    + File.separator
	                    + "main"
	                    + File.separator
	                    + "resources"
	                    + File.separator
	                    + "static"
	                    + File.separator
	                    + "assets"
	                    + File.separator
	                    + "images"
	                    + File.separator
	                    + "logo"
	                    + File.separator
	                    + "logo.jpg";

	            File logoFile =
	                    new File(logoPath);

	            if (logoFile.exists()) {

	                Image logo =
	                        Image.getInstance(logoPath);

	                logo.scaleAbsolute(50, 50);

	                logo.setAlignment(Element.ALIGN_LEFT);

	                cell.addElement(logo);
	            }

	        } catch (Exception e) {

	            e.printStackTrace();
	        }

	        // =========================
	        // COMPANY NAME
	        // =========================

	        Font companyFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        22,
	                        Font.BOLD,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph company =
	                new Paragraph(
	                        "AMENTROP",
	                        companyFont
	                );

	        company.setAlignment(Element.ALIGN_LEFT);

	        cell.addElement(company);

	        // =========================
	        // TAGLINE
	        // =========================

	        Font tagFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        10,
	                        Font.NORMAL,
	                        BaseColor.WHITE
	                );

	        Paragraph tag =
	                new Paragraph(
	                        "Shaping Ideas. Building Future.",
	                        tagFont
	                );

	        cell.addElement(tag);

	        // =========================
	        // CERTIFICATE ID
	        // =========================

	        String certificateId =
	                "AMENTROP-"
	                + LocalDate.now()
	                + "-"
	                + user.getId();

	        Font idFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        8,
	                        Font.NORMAL,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph id =
	                new Paragraph(
	                        "Certificate ID : "
	                        + certificateId,
	                        idFont
	                );

	        id.setAlignment(Element.ALIGN_RIGHT);

	        cell.addElement(id);

	        // =========================
	        // TITLE
	        // =========================

	        Font titleFont =
	                new Font(
	                        Font.FontFamily.TIMES_ROMAN,
	                        38,
	                        Font.BOLD,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph title =
	                new Paragraph(
	                        "CERTIFICATE",
	                        titleFont
	                );

	        title.setAlignment(Element.ALIGN_CENTER);

	        title.setSpacingBefore(5);

	        cell.addElement(title);

	        // =========================
	        // SUBTITLE
	        // =========================

	        Font subFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        14,
	                        Font.NORMAL,
	                        BaseColor.WHITE
	                );

	        Paragraph sub =
	                new Paragraph(
	                        "OF INTERNSHIP",
	                        subFont
	                );

	        sub.setAlignment(Element.ALIGN_CENTER);

	        cell.addElement(sub);

	        // =========================
	        // CERTIFY TEXT
	        // =========================

	        Font normalFont =
	                new Font(
	                        Font.FontFamily.TIMES_ROMAN,
	                        13,
	                        Font.NORMAL,
	                        BaseColor.WHITE
	                );

	        Paragraph certify =
	                new Paragraph(
	                        "This is to certify that",
	                        normalFont
	                );

	        certify.setAlignment(Element.ALIGN_CENTER);

	        certify.setSpacingBefore(10);

	        cell.addElement(certify);

	        // =========================
	        // USER NAME
	        // =========================

	        Font nameFont =
	                new Font(
	                        Font.FontFamily.COURIER,
	                        26,
	                        Font.BOLDITALIC,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph name =
	                new Paragraph(
	                        user.getFullName(),
	                        nameFont
	                );

	        name.setAlignment(Element.ALIGN_CENTER);

	        name.setSpacingBefore(6);

	        cell.addElement(name);

	        // =========================
	        // GOLD LINE
	        // =========================

	        Font lineFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        12,
	                        Font.NORMAL,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph line =
	                new Paragraph(
	                        "_____________________________________",
	                        lineFont
	                );

	        line.setAlignment(Element.ALIGN_CENTER);

	        cell.addElement(line);

	        // =========================
	        // DESCRIPTION
	        // =========================

	        String descText =
	                "Has completed the Internship Program at Amentrop "
	                + "with dedication and outstanding performance in "
	                + fresher.getDomainInterested()
	                + ".";

	        Paragraph desc =
	                new Paragraph(
	                        descText,
	                        normalFont
	                );

	        desc.setAlignment(Element.ALIGN_CENTER);

	        desc.setLeading(18);

	        desc.setSpacingBefore(8);

	        cell.addElement(desc);

	        // =========================
	        // DATE
	        // =========================

	        Font bottomFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        10,
	                        Font.NORMAL,
	                        BaseColor.WHITE
	                );

	        Paragraph date =
	                new Paragraph(
	                        "Date Of Issue : "
	                        + LocalDate.now(),
	                        bottomFont
	                );

	        date.setSpacingBefore(15);

	        date.setAlignment(Element.ALIGN_LEFT);

	        cell.addElement(date);

	        // =========================
	        // SIGNATURE
	        // =========================

	        Font signFont =
	                new Font(
	                        Font.FontFamily.COURIER,
	                        16,
	                        Font.ITALIC,
	                        BaseColor.WHITE
	                );

	        Paragraph sign =
	                new Paragraph(
	                        "Amentrop HR",
	                        signFont
	                );

	        sign.setAlignment(Element.ALIGN_RIGHT);

	        sign.setSpacingBefore(-10);

	        cell.addElement(sign);

	        Font authFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        9,
	                        Font.BOLD,
	                        new BaseColor(212, 175, 55)
	                );

	        Paragraph auth =
	                new Paragraph(
	                        "AUTHORIZED SIGNATORY",
	                        authFont
	                );

	        auth.setAlignment(Element.ALIGN_RIGHT);

	        cell.addElement(auth);

	        // =========================
	        // FOOTER
	        // =========================

	        Font footerFont =
	                new Font(
	                        Font.FontFamily.HELVETICA,
	                        6,
	                        Font.ITALIC,
	                        BaseColor.LIGHT_GRAY
	                );

	        Paragraph footer =
	                new Paragraph(
	                        "This is a system generated certificate.",
	                        footerFont
	                );

	        footer.setAlignment(Element.ALIGN_CENTER);

	        footer.setSpacingBefore(5);

	        cell.addElement(footer);

	        // =========================
	        // ADD TABLE
	        // =========================

	        mainTable.addCell(cell);

	        document.add(mainTable);

	        document.close();

	        // =========================
	        // SAVE / UPDATE DB
	        // =========================

	        Optional<InternshipCertificate> existingCertificate =
	                internshipCertificateRepository
	                .findAll()
	                .stream()
	                .filter(c ->
	                        c.getUser()
	                        .getId()
	                        .equals(user.getId())
	                )
	                .findFirst();

	        InternshipCertificate certificate;

	        if (existingCertificate.isPresent()) {

	            certificate =
	                    existingCertificate.get();

	        } else {

	            certificate =
	                    new InternshipCertificate();

	            certificate.setUser(user);
	        }

	        certificate.setFilePath(fileName);

	        internshipCertificateRepository.save(certificate);

	        return fileName;

	    }
	    catch (Exception e) {

	        e.printStackTrace();

	        return null;
	    }
	}
	}