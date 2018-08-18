package com.websystique.springmvc.model;

public class Record {
	private int reference;
	private String accountNumber;
	private float startBalance;
	private float mutation;
	private String description;
	private float endBalance;
	public int getReference() {
		return reference;
	}
	public void setReference(int reference) {
		this.reference = reference;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public float getStartBalance() {
		return startBalance;
	}
	public void setStartBalance(float startBalance) {
		this.startBalance = startBalance;
	}
	public float getMutation() {
		return mutation;
	}
	public void setMutation(float mutation) {
		this.mutation = mutation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public float getEndBalance() {
		return endBalance;
	}
	public void setEndBalance(float endBalance) {
		this.endBalance = endBalance;
	}
	
}
