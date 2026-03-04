//
//  DashboardView.swift
//  Scholarships
//
//  Created by Rival Fauzi on 20/02/26.
//

import SwiftUI

struct DashboardView: View {
    
    @ObservedObject var viewModel: DashboardViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 16) {
                headerSection
                heroSection
                taskSection
                targetSection
                deadlineSection
            }
            .padding(.horizontal, 16)
        }
        .background(
            Image("MainBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .task {
            await viewModel.loadScholarships()
        }
    }
}

private extension DashboardView {
    var headerSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("Siap lanjut, Rival?  🔥")
                    .font(.title2)
                    .foregroundColor(.surface)
                
                Text("Ada deadline yang perlu kamu kejar.")
                    .font(.subheadline)
                    .foregroundColor(.surface)
            }
            
            Spacer()
            
            Image("defaultProfile")
                .resizable()
                .frame(width: 60, height: 60)
        }
    }
    
    var heroSection: some View {
        AppCard {
            VStack(alignment: .leading) {
                HStack {
                    Text("LPDP 2026 🇮🇩")
                        .font(.headline)
                        .foregroundColor(Color.textPrimary)
                    Spacer()
                    DeadlineCard(text: "87 hari lagi")
                }
                
                Text("Deadline: 12 Sept 2026")
                    .font(.footnote)
                    .foregroundColor(Color.textSecondary)
                
                HStack(spacing: 12) {
                    AppProgressBar(progress: 0.65)
                    
                    Text("65%")
                        .font(.caption)
                        .foregroundColor(Color.textPrimary)
                }
                
                Button {
                    viewModel.navigate(.roadmap(id: ""))
                } label: {
                    Text("Lanjutkan Rencana 🚀")
                        .font(.footnote)
                }
                .buttonStyle(PrimaryButtonParameterizeStyle(
                    foregroundColor: Color.surface,
                    height: 40,
                    cornerRadius: 20
                ))
                .padding(.top, 12)

            }
        }
    }
    
    var taskSection: some View {
        AppCard {
            VStack(alignment: .leading) {
                Text("Kerjakan Sekarang")
                    .font(.headline)
                    .foregroundColor(Color.textPrimary)
                
                SecondaryAppCard {
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Finalkan Personal Statment")
                                    .font(.subheadline)
                                    .foregroundColor(Color.textPrimary)
                                
                                Text("LPDP 2026")
                                    .font(.caption)
                                    .foregroundColor(.textSecondary)
                            }
                            
                            Spacer()
                            DeadlineCard(text: "5 hari lagi")
                        }
                        
                        HStack {
                            Text("• 3 catatan")
                                .font(.caption2)
                                .foregroundColor(.textSecondary)
                            
                            Text("|")
                                .font(.caption2)
                                .foregroundColor(.textSecondary)
                            
                            Image(systemName: "exclamationmark.triangle")
                                .font(.caption2)
                                .foregroundColor(.textSecondary)
                            
                            Text("Dokumen belum tersedia")
                                .font(.caption2)
                                .foregroundColor(.textSecondary)
                        }
                        .padding(.top, 8)
                        
                        HStack(spacing: 16) {
                            IconOutlineButton(title: "Tambah Catatan", systemImage: "plus", borderColor: .accentColor, backgroundColor: .background, foregroundColor: .accentColor, height: 40, cornerRadius: 20, font: .caption2) {
                                print("OOOOOOkkkkkkkkeeeeeee")
                            }
                            
                            IconOutlineButton(title: "Unggah Dokumen", systemImage: "square.and.arrow.up", borderColor: .accentColor, backgroundColor: .background, foregroundColor: .accentColor, height: 40, cornerRadius: 20, font: .caption2) {
                                
                            }
                        }
                        .padding(.top, 12)
                    }
                }
            }
        }
    }
    
    var targetSection: some View {
        AppCard {
            VStack(alignment: .leading) {
                HStack {
                    Text("Target Minggu Ini")
                        .font(.headline)
                        .foregroundColor(Color.textPrimary)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.textSecondary)
                    }

                }
                
                List() {
                    
                }
            }
        }
    }
    
    var deadlineSection: some View {
        AppCard {
            VStack(alignment: .leading) {
                HStack {
                    Text("Deadline Paling Dekat")
                        .font(.headline)
                        .foregroundColor(Color.textPrimary)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.textSecondary)
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 16) {
                        ForEach(viewModel.scholarships) { item in
                            ScholarshipListCell(imageFlag: item.country, title: item.name, deadline: item.deadline ?? "")
                        }
                    }
                }
            }
        }
    }
}
