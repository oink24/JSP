package dto;

public class MemberDTO {

	private String uid;
	private String name;
	private String hp;
	private String pos;
	private int dep;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getPos() {
		return pos;
	}
	public void setPos(String pos) {
		this.pos = pos;
	}
	public int getDep() {
		return dep;
	}
	public void setDep(int dep) {
		this.dep = dep;
	}
	public void setDep(String dep) {
		this.dep = Integer.parseInt(dep);
	}
	
	@Override
	public String toString() {
		return "uid:"+uid+", name:"+name+", hp:"+hp+", pos:"+pos+", dep:"+dep;
	}
}
