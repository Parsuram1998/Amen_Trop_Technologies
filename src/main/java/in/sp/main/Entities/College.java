package in.sp.main.Entities;

import java.time.LocalDateTime;

import in.sp.main.Enums.CollegeStatus;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "colleges")
public class College {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String collegeName;

    @Column(nullable = false)
    private String collegeWebsite;

    @Column(nullable = false)
    private String collegeType;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String state;

    @Column(nullable = false)
    private String district;

    @Column(nullable = false)
    private String city;

    @Column(nullable = false)
    private String pincode;

    @Column(nullable = false)
    private String naacAccreditation;

    private String naacGrade;

    @Column(nullable = false)
    private String tpoName;

    @Column(nullable = false)
    private String tpoPhone;

    @Column(nullable = false, unique = true)
    private String tpoEmail;

    // Services Required
    private boolean campusHiring;

    private boolean placementSupport;

    private boolean industryTraining;

    private boolean csrDrive;

    private boolean workshopSeminar;

    // Admin Approval
    @Enumerated(EnumType.STRING)
    private CollegeStatus status;
    
    private LocalDateTime registeredAt;
    
    private String remarks;

    private LocalDateTime approvedAt;

    private LocalDateTime updatedAt;

    private boolean active;
    
    

    public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public LocalDateTime getApprovedAt() {
		return approvedAt;
	}

	public void setApprovedAt(LocalDateTime approvedAt) {
		this.approvedAt = approvedAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public College() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getCollegeWebsite() {
        return collegeWebsite;
    }

    public void setCollegeWebsite(String collegeWebsite) {
        this.collegeWebsite = collegeWebsite;
    }

    public String getCollegeType() {
        return collegeType;
    }

    public void setCollegeType(String collegeType) {
        this.collegeType = collegeType;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getNaacAccreditation() {
        return naacAccreditation;
    }

    public void setNaacAccreditation(String naacAccreditation) {
        this.naacAccreditation = naacAccreditation;
    }

    public String getNaacGrade() {
        return naacGrade;
    }

    public void setNaacGrade(String naacGrade) {
        this.naacGrade = naacGrade;
    }

    public String getTpoName() {
        return tpoName;
    }

    public void setTpoName(String tpoName) {
        this.tpoName = tpoName;
    }

    public String getTpoPhone() {
        return tpoPhone;
    }

    public void setTpoPhone(String tpoPhone) {
        this.tpoPhone = tpoPhone;
    }

    public String getTpoEmail() {
        return tpoEmail;
    }

    public void setTpoEmail(String tpoEmail) {
        this.tpoEmail = tpoEmail;
    }

    public boolean isCampusHiring() {
        return campusHiring;
    }

    public void setCampusHiring(boolean campusHiring) {
        this.campusHiring = campusHiring;
    }

    public boolean isPlacementSupport() {
        return placementSupport;
    }

    public void setPlacementSupport(boolean placementSupport) {
        this.placementSupport = placementSupport;
    }

    public boolean isIndustryTraining() {
        return industryTraining;
    }

    public void setIndustryTraining(boolean industryTraining) {
        this.industryTraining = industryTraining;
    }

    public boolean isCsrDrive() {
        return csrDrive;
    }

    public void setCsrDrive(boolean csrDrive) {
        this.csrDrive = csrDrive;
    }

    public boolean isWorkshopSeminar() {
        return workshopSeminar;
    }

    public void setWorkshopSeminar(boolean workshopSeminar) {
        this.workshopSeminar = workshopSeminar;
    }

   

    public CollegeStatus getStatus() {
		return status;
	}

	public void setStatus(CollegeStatus status) {
		this.status = status;
	}

	public LocalDateTime getRegisteredAt() {
        return registeredAt;
    }

    public void setRegisteredAt(LocalDateTime registeredAt) {
        this.registeredAt = registeredAt;
    }
}