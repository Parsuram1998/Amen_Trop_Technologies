package in.sp.main.Entities;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="jobs")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;

    private String companyName;

    private String location;

    private String domain;

    private String description;

    private String eligibility;

    private int minExperience;

    private double minPercentage;

    private Boolean strictApply;
    
    @Column(name="job_type")
    private String jobType;
    
    @Column(name = "bond_required")
    private Boolean bondRequired;

    private LocalDateTime createdAt;
    private String eligibleBranch;

    private Integer eligibleYearOfPassout;
    
    @Column(name = "drive_ended", nullable = false)
    private boolean driveEnded = false;
    
	public Boolean getStrictApply() {
		return strictApply;
	}

	public void setStrictApply(Boolean strictApply) {
		this.strictApply = strictApply;
	}

	public Boolean getBondRequired() {
		return bondRequired;
	}

	public void setBondRequired(Boolean bondRequired) {
		this.bondRequired = bondRequired;
	}

	public String getEligibleBranch() {
		return eligibleBranch;
	}

	public void setEligibleBranch(String eligibleBranch) {
		this.eligibleBranch = eligibleBranch;
	}

	public Integer getEligibleYearOfPassout() {
		return eligibleYearOfPassout;
	}

	public void setEligibleYearOfPassout(Integer eligibleYearOfPassout) {
		this.eligibleYearOfPassout = eligibleYearOfPassout;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEligibility() {
		return eligibility;
	}

	public void setEligibility(String eligibility) {
		this.eligibility = eligibility;
	}

	public int getMinExperience() {
		return minExperience;
	}

	public void setMinExperience(int minExperience) {
		this.minExperience = minExperience;
	}

	public double getMinPercentage() {
		return minPercentage;
	}

	public void setMinPercentage(double minPercentage) {
		this.minPercentage = minPercentage;
	}

	public boolean isStrictApply() {
		return strictApply;
	}

	public void setStrictApply(boolean strictApply) {
		this.strictApply = strictApply;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public String getJobType() {
		return jobType;
	}

	public void setJobType(String jobType) {
		this.jobType = jobType;
	}

	public boolean isBondRequired() {
		return bondRequired;
	}

	public void setBondRequired(boolean bondRequired) {
		this.bondRequired = bondRequired;
	}

	public boolean isDriveEnded() {
		return driveEnded;
	}

	public void setDriveEnded(boolean driveEnded) {
		this.driveEnded = driveEnded;
	}

  
    
    
}