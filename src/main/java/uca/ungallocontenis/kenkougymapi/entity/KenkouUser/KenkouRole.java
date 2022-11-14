package uca.ungallocontenis.kenkougymapi.entity.KenkouUser;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "KenkouRole")
@Table(name = "kenkou_role")
public class KenkouRole {
    
    @Id
    @Column(name = "role_code")
    private String roleCode;
    @Column(name = "role_name")
    private String roleName;
    // @ManyToMany(mappedBy = "usersRoles")
    // private List<KenkouUser> usersByRole;

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    // public List<KenkouUser> getUsersByRole() {
    //     return usersByRole;
    // }

    // public void setUsersByRole(List<KenkouUser> usersByRole) {
    //     this.usersByRole = usersByRole;
    // }

    @Override
    public String toString() {
        return "KenkouRole [roleCode=" + roleCode + ", roleName=" + roleName + "]";
    }
}